package com.helltalk.springapp.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

/*
 
	아래 클래스 작성후 해야할 작업들 순서
	1. AuthController.java의 서비스 주입 및 로그인 처리 및 로그아웃 처리 주석
	2. Login.jsp의 로그인폼의 action속성을 반드시
	   loginProcessingUrl()메소드에 지정한 경로와 일치 시켜야한다
	3. Login.jsp의 세션영역에서 ${sessionScope.id}를 읽어오는 부분을
	   모두 security 태그 라이브러를 사용해서 변경한다.
	4. Top.jsp도 3번과 같이 security 태그 라이브러를 사용해서 변경
	5. .java(컨트롤러)에서 세션영역에서 읽어오는 코드(@ModelAttribue String id)를 모두 Autentication클래스를 
	      사용한 코드로 변경
	   (@SessionAttribute나 HttpSesion등은 주석처리)
	   
	즉
	컨트롤러 단에서는 @SessionAttribute대신 스프링 씨큐리티 코드로 변경
	뷰단(JSP)에서는 스프링 씨큐리티 태그 라이브러리로 변경

 */


//1.web.xml에서 XML기반이 아닌 어노테이션 기반 설정이 적용되도록 수정
//2.자바코드로 스프링 씨큐리티 설정
//@Configuration
//@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	
	//인증 및 접근제한등을 설정(Authentication 설정)
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		/*
		super.configure(http);
		위 메소드의 구현 내용
		http
			.authorizeRequests()  //요청에 대해 씨큐리티 인증을 시작한다
			.anyRequest().authenticated() //어떤 요청이든지 권한이 있어야 한다
			.and()//그리고
			.formLogin()  //폼기반의 인증
			.and()
			.httpBasic();//HTTP기본인증 사용
	   */
		
		//스프링 씨큐리티 기본 테스트(메모리기반 인증)		
		/*
		http
			.authorizeRequests()
			.anyRequest().authenticated()
			.and()
			.formLogin() 
			.and()
			.csrf().disable();//CSRF보안 비 활성화*/
		
		http
			//인증설정
			.authorizeRequests()
			//https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/util/AntPathMatcher.html
			.antMatchers("/onememo/bbs/**").hasRole("USER")//ROLE_는 반드시 생략.자동으로 추가됨으로
			.anyRequest().permitAll()//모든 요청에 대해 인증 없이 처리 .antMatchers("/**").hasRole("ANONYMOUS") 혹은 .antMatchers( "/**").permitAll()
			.and()//HttpSecurity 반환
			//폼기반 로그인 인증설정
			.formLogin()
			.loginPage("/onememo/auth/Login.do")//로그인 폼 URL설정.기본값은 "/login" 
			.loginProcessingUrl("/onememo/auth/LoginProcess.do")//폼의 action속성값.실제 로그인처리는 씨큐리티가 한다.(컨트롤러에서 로그인 처리 부분이 불필요)
			.failureUrl("/onememo/auth/Login.do")//로그인 실패시 보여질 페이지 URL설정."login?error" 기본값
			.failureHandler((request,response,exception)->{
				request.setAttribute("NotMember", "회원정보 불일치");
				request.getRequestDispatcher("/onememo/auth/Login.do").forward(request, response);
			})//로그인 실패시 처리할 핸들러 설정.failureUrl()보다 우선
			.usernameParameter("id")//로그인 폼 아이디 입력 필드의  name 속성값. 기본값은 "username"
			.passwordParameter("pwd")//로그인 폼 패스워드 입력 필드의 name 속성값. 기본값은 "password"
			.defaultSuccessUrl("/")//인증 성공후 이동할 URL설정.로그인 성공시 직전에 방문했던 페이지로 리다이렉트(기본값).true로 설정시 지정한 URL로 무조건 리다이렉트 즉 defaultSuccessUrl("/",true)
			//.successHandler((request,response,authentication)->{//인증 성공후 이동할 URL설정.defaultSuccessUrl("/")보다 우선
			//	authentication객체로 인증된 사용자 정보(아이디 혹은 권한등)를 파악할수 있다
			//	response.sendRedirect(request.getContextPath());
			//})
			.and()		
			//로그아웃 설정
			.logout()//기본값은 "/logout" 즉 HTML태그에서 로그아웃 URL을 /logout으로.단,실제 로그아웃처리는 씨큐리티가 한다.(컨트롤러에서 로그아웃 처리 부분이 불필요)             
			.logoutUrl("/onememo/auth/Logout.do")//로그아웃 URL설정 변경시(오버라이딩).단,실제 로그아웃처리는 씨큐리티가 한다.(컨트롤러에서 로그아웃 처리 부분이 불필요)              
			.and()
			/*
			CSRF(Cross Site Resquest Fosery) 공격을 방어하기 위한 설정
		   	CSRF방어 설정시에는  
			1.모든 폼  입력에 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>추가
			2.로그아웃을 POST방식으로 구현
			단,CSRF 방어를 사용하지 않도록 되어있다면 GET 방식으로도 처리 가능하다		
			예]
			<form:form action="<c:url value='/logout'/>" method="POST">
				<input type="submit" value="로그아웃" />
			</form:form>
			*/
			//.csrf().disable() //기본값이 csrf활성화
			//중복 로그인 방지를 위한 설정
			.sessionManagement()
			.invalidSessionUrl("/onememo/auth/Login.do")//세션이 끊어젔을때 이동 할 URL지정(중복으로 인해 끊어진 경우도 해당함).              
			.maximumSessions(1)//최대 허용 가능 중복 세션 수.(중복 로그인 방지하기 위해 1로 설정)
			.maxSessionsPreventsLogin(true)//true설정시 기존에 로그인 했던 사용자 우선.기본값은 false로 새롭게 로그인한 사용자가 우선 즉 기존 사용자는 자동 로그아웃됨
			.expiredUrl("/onememo/auth/Login.do");//만기된 세션 즉 세션 유효시간이 경과 한 경우 이동할 URL(중복으로 인해 끊어진 경우도 해당함).
	}
	//사용자의 Authorization 설정(메모리 기반 혹은 JDBC기반 혹은 UserDetailsService 구현 기반)	
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		/*
		//메모리 기반 인증
		auth
			.inMemoryAuthentication()
			.withUser("kosmo").password("1234").roles("USER")
			.and()
			.withUser("spring").password("1234").roles("ADMIN","USER");*/
		//JDBC기반 인증
		auth
			.jdbcAuthentication()
			.dataSource(hikariDataSource())
			//ENABLED가 0인 경우 아이디와 비번이 일치해도 인증이 거부됨(즉 로그인 실패) 즉 계정을 비활성홤(잠금)
			.usersByUsernameQuery("select id as username, pass as password, enabled from users where id = ?")
			.authoritiesByUsernameQuery("select id as username, authority   from users where id = ?")
			.passwordEncoder(passwordEncoder());
	}////////////////////////
	//org.springframework.security.crypto.password.PasswordEncoder
	//@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}	
	
	//@Bean 
	public HikariDataSource hikariDataSource() {		
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName("oracle.jdbc.OracleDriver");
		hikariConfig.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
		hikariConfig.setUsername("SPRING");
		hikariConfig.setPassword("SPRING");
		return new HikariDataSource(hikariConfig);
	}
	
	
}//////////
