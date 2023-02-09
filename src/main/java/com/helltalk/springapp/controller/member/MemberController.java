package com.helltalk.springapp.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.helltalk.springapp.models.CustomUserDetailsService;
import com.helltalk.springapp.service.KakaoServiceImpl;
import com.helltalk.springapp.service.MemberServiceImpl;

import kr.co.bootpay.model.request.Authentication;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private KakaoServiceImpl kakaoService;
	@Autowired
	private MemberServiceImpl service;
	@Autowired
	private PasswordEncoder passwordEncoder; //SecurityConfig에 빈으로 등록한 비밀번호 암호화 메소드 주입
	@Autowired
	protected CustomUserDetailsService userDetailsService;
	
	@RequestMapping("/Login.do")
	public String login() {
		return "member/login/login";
	}
	
	@RequestMapping("/oauto/Kakao")
	public String kakaoLogin(String code,RedirectAttributes redirect,HttpServletRequest request) throws Throwable {
		System.out.println("인가코드:"+code);
		
		String access_Token = kakaoService.getAccessToken(code);
		System.out.println("AccessToken:"+access_Token);
		
		HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
		String nickname= (String)userInfo.get("nickname");
		String username= (String)userInfo.get("email");
		System.out.println("###nickname#### : " + nickname);
		System.out.println("###email#### : " + username);
		FlashMap fm = RequestContextUtils.getOutputFlashMap(request);
		fm.put("nickname", userInfo.get("nickname"));
		fm.put("u_email", userInfo.get("email"));
		fm.put("id", userInfo.get("id"));
		return "redirect:/member/SoicalLogin";
	}
	
	//https://velog.io/@jakezo/%EC%8A%A4%ED%94%84%EB%A7%81-redirect-%ED%8C%8C%EB%9D%BC%EB%AF%B8%ED%84%B0-%EC%B2%98%EB%A6%AC
	//컨트롤러에서 redirect 방식으로 값 전달 하는 방법
	
	@RequestMapping("/SoicalLogin")
	public String soicalLogin(Map map,Model model,HttpServletResponse response,HttpServletRequest request) throws Throwable {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		String email = (String) map.put("u_email", flashMap.get("u_email"));
		String nickname =(String)map.put("nickname", flashMap.get("nickname"));
		String id =(String)map.put("id", flashMap.get("id"));
		
		int affectedEm = service.emailCheck(map);
			if(affectedEm == 0) {
				model.addAttribute("nickname",email);
				model.addAttribute("email",nickname);
				model.addAttribute("id",id);
				PrintWriter w = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
		        w.write("<script>"
		        		+ "alert('"+email+" 님에 대한 회원정보가 없습니다.\\n"
		        		+ "추가정보 입력을 위해 회원가입 페이지로 이동합니다.');"
		        		+ "</script>");
		        w.flush();
		        return "forward:/member/CreateUser.do";
			}
			else {
					UserDetails userDetails = userDetailsService.loadUserByUsername(email);
					UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
					userDetails.getUsername(),
					userDetails.getPassword(),
					userDetails.getAuthorities());
			        SecurityContextHolder.getContext().setAuthentication(authentication);
					return "redirect:/";
					
				
				}
		
	}
	
	@RequestMapping("/CreateUser.do")
	public String createUser() {
		return "member/register/register";
	}
	
	@RequestMapping("/Success.do")
	public String successRegister() {
		return "member/register/success.helltalk";
	}
	
	//접근금지 화면
	@RequestMapping("/forbidden.do")
	public String forbidden() {
		return "member/forbidden/forbidden";
	}
	
	
	
	@RequestMapping("/register.do")//회원가입 컨트롤러
	public String register(@RequestParam Map<String,String> map,Model model,HttpServletResponse response) throws IOException {
		int affectedEm = service.emailCheck(map);//이메일 서버단에서 중복체크
		int affectedName = service.nicknameCheck(map);
		String nickname="";
		String email="";
		String rawPassword =map.get("u_pwd");
		String soicalOrUser = map.get("u_soical");
		System.out.println("암호화 전 비번:"+rawPassword);
		if(affectedEm + affectedName == 0 ) {
			if(soicalOrUser == null) {
				//비밀번호 암호화
				String encodedPassword = passwordEncoder.encode(rawPassword);
				System.out.println("암호화된 비번(일반유저):"+encodedPassword);
				map.put("u_pwd", encodedPassword);
				service.insertUser(map);
				nickname = map.get("u_nickname");
				model.addAttribute("nickname",nickname);
				return "forward:/member/Success.do";
			}
			else {
				String encodedPassword = passwordEncoder.encode(rawPassword);
				System.out.println("암호화된 비번(소셜유저):"+encodedPassword);
				map.put("u_pwd", encodedPassword);
				service.insertSoicalUser(map);
				nickname = map.get("u_nickname");
				model.addAttribute("nickname",nickname);
				return "forward:/member/Success.do";
			}
			
			
			
		}else if(affectedEm != 0){
			email = map.get("u_email");
			response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	        w.write("<script>alert('"+email+"는 현재 사용중인 이메일 입니다.');history.back();</script>");
	        w.close();
	        
		}else if (affectedName != 0) {
			nickname = map.get("u_nickname");
			response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	        w.write("<script>alert('"+nickname+"는 현재 사용중인 닉네임 입니다.');history.back();</script>");
	        w.close();
		}
		return "";
		
	}
	
	
	
	
	
	
	
}
