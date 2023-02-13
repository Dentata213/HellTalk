package com.helltalk.springapp.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;


@Configuration
@EnableWebSecurity
@PropertySource({"classpath:config/database.properties"})
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	
	//히카리 커넥션 풀 사용:server.xml 및 context.xml에 커넥션 풀 관련 설정 불 필요
	@Value("${driverClassName}")
	private String driverClassName;
	@Value("${url}")
	private String url;
	@Value("${happyuser}")
	private String username;
	@Value("${password}")
	private String password;
	

	@Bean 
	public HikariDataSource hikariDataSource() {
		HikariConfig hikariConfig = new HikariConfig();
		System.out.println(driverClassName);
		System.out.println(url);
		System.out.println(username);
		System.out.println(password);
		
		hikariConfig.setDriverClassName(driverClassName);
		hikariConfig.setJdbcUrl(url);
		hikariConfig.setUsername(username);
		hikariConfig.setPassword(password);
		return new HikariDataSource(hikariConfig);
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		
		web
				.ignoring()
				.antMatchers("/resources/**");
	}
	
	//인증 및 접근제한등을 설정(Authentication 설정)
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		//한글깨짐 방지 추가 : 시큐리티 적용시 web.xml에 등록한 한글깨짐 방지 필터가 적용되지 않음
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);
		http.addFilterBefore(filter, CsrfFilter.class);
		http.headers().frameOptions().disable(); //ifram 차단해제
		http.csrf().csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse());
		http
			//인증설정
			.authorizeRequests()
			//https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/util/AntPathMatcher.html
			.antMatchers("/","/resources/**","/SuccessLoginHome.do","/member/Login.do","/member/CreateUser.do","/member/register.do","/member/Success.do","/Android/**","/payment/**").permitAll()
			.antMatchers("/model/shop-1.do","/model/routine.do","/model/ocr.do","/home.do","/cal/List.do","/chat1.do","/diet/**","/exercise.do","/model/**","/exercise/**").hasAnyRole("USER","TN","ADMIN")//유저와 트레이너 권한이 있어야 열람할수 있는 페이지, ROLE_는 반드시 생략.자동으로 추가됨으로
			.antMatchers("/backend/*").hasRole("ADMIN")//어드민 권한이 있어야 가능
			.and()//HttpSecurity 반환
			//폼기반 로그인 인증설정
			.formLogin()
			.loginPage("/member/Login.do")//로그인 폼 URL설정.기본값은 "/login" 
			.loginProcessingUrl("/member/LoginProcess.do")//폼의 action속성값.실제 로그인처리는 씨큐리티가 한다.(컨트롤러에서 로그인 처리 부분이 불필요)
			.failureUrl("/member/Login.do")//로그인 실패시 보여질 페이지 URL설정."login?error" 기본값
											//로그인 form으로 파라미터값 ?error로 보냄 
			.failureHandler(authenticationFailureHandler())//로그인 실패시 처리할 핸들러 설정.failureUrl()보다 우선
			
			.usernameParameter("id")//로그인 폼 아이디 입력 필드의  name 속성값. 기본값은 "username"
			.passwordParameter("pwd")//로그인 폼 패스워드 입력 필드의 name 속성값. 기본값은 "password"
			//.defaultSuccessUrl("/")//인증 성공후 이동할 URL설정.로그인 성공시 직전에 방문했던 페이지로 리다이렉트(기본값).true로 설정시 지정한 URL로 무조건 리다이렉트 즉 defaultSuccessUrl("/",true)
			//.successHandler((request,response,authentication)->{//인증 성공후 이동할 URL설정.defaultSuccessUrl("/")보다 우선
			//authentication객체로 인증된 사용자 정보(아이디 혹은 권한등)를 파악할수 있다
			//response.sendRedirect(request.getContextPath());
			//})
			.and()
			//로그아웃 설정
			.logout()//기본값은 "/logout" 즉 HTML태그에서 로그아웃 URL을 /logout으로.단,실제 로그아웃처리는 씨큐리티가 한다.(컨트롤러에서 로그아웃 처리 부분이 불필요)             
			.logoutUrl("/member/Logout.do")//로그아웃 URL설정 변경시(오버라이딩).단,실제 로그아웃처리는 씨큐리티가 한다.(컨트롤러에서 로그아웃 처리 부분이 불필요)
			.invalidateHttpSession(true)
			.deleteCookies("JSESSIONID")
			.logoutSuccessUrl("/")
			.and()
			.exceptionHandling()
		    .accessDeniedPage("/member/forbidden.do")
		    /*
		    .accessDeniedHandler((request,response,authentication)->{
		    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		    	UserDetails userDetails = (UserDetails)principal;
		    	String username = userDetails.getUsername();
		    	request.setAttribute("username", username);
		    	
		    	
		    })
		    */
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
			.invalidSessionUrl("/member/Login.do")//세션이 끊어젔을때 이동 할 URL지정(중복으로 인해 끊어진 경우도 해당함).              
			.maximumSessions(1)//최대 허용 가능 중복 세션 수.(중복 로그인 방지하기 위해 1로 설정)
			.maxSessionsPreventsLogin(false)//true설정시 기존에 로그인 했던 사용자 우선.기본값은 false로 새롭게 로그인한 사용자가 우선 즉 기존 사용자는 자동 로그아웃됨
			.expiredUrl("/member/Login.do");//만기된 세션 즉 세션 유효시간이 경과 한 경우 이동할 URL(중복으로 인해 끊어진 경우도 해당함).
			
			
	}
	
	//사용자의 Authorization 설정(메모리 기반 혹은 JDBC기반 혹은 UserDetailsService 구현 기반)	
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.jdbcAuthentication()
			.dataSource(hikariDataSource())
			//ENABLED가 0인 경우 아이디와 비번이 일치해도 인증이 거부됨(즉 로그인 실패) 즉 계정을 비활성홤(잠금)
			.usersByUsernameQuery("select u_email as username, u_pw as password, u_status as enabled from users where u_email = ?")
			.authoritiesByUsernameQuery("select u_email as username, u_kind as authority from users where u_email = ?")
			.passwordEncoder(passwordEncoder());
		
	}////////////////////////
	//org.springframework.security.crypto.password.PasswordEncoder
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}	
	
	//커스텀 로그인실패 클래스 빈으로 등록
	public AuthenticationFailureHandler authenticationFailureHandler() {
	    return new SecurityFailureHandler();
	} 

	
	
}//////////
