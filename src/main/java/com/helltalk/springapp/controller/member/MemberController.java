package com.helltalk.springapp.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.helltalk.springapp.service.MemberServiceImpl;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl service;
	@Autowired
	private PasswordEncoder passwordEncoder; //SecurityConfig에 빈으로 등록한 비밀번호 암호화 메소드 주입
	
	@RequestMapping("/Login.do")
	public String Login() {
		return "member/login/login";
	}
	
	@RequestMapping("/CreateUser.do")
	public String createUser() {
		return "member/register/register";
	}
	
	@RequestMapping("/Success.do")
	public String SuccessRegister() {
		return "member/register/success.helltalk";
	}
	
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
		if(affectedEm + affectedName == 0 ) {
			String rawPassword = map.get("u_pwd");
			String encodedPassword = passwordEncoder.encode(rawPassword); //비밀번호 암호화
			System.out.println("암호화된 비번:"+encodedPassword);
			map.put("u_pwd", encodedPassword);
			service.insertUser(map);
			nickname = map.get("u_nickname");
			model.addAttribute("nickname",nickname);
			return "forward:/member/Success.do";
			
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
