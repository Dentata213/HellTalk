package com.helltalk.springapp.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.helltalk.springapp.service.KakaoServiceImpl;
import com.helltalk.springapp.service.MemberServiceImpl;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private KakaoServiceImpl kakaoService;
	@Autowired
	private MemberServiceImpl service;
	@Autowired
	private PasswordEncoder passwordEncoder; //SecurityConfig에 빈으로 등록한 비밀번호 암호화 메소드 주입
	
	@RequestMapping("/Login.do")
	public String Login() {
		return "member/login/login";
	}
	
	@RequestMapping("/KakaoLogin")
	public void KakaoLogin(String code,Model model,HttpServletResponse response) throws Throwable {
		System.out.println("인가코드:"+code);
		
		String access_Token = kakaoService.getAccessToken(code);
		System.out.println("AccessToken:"+access_Token);
		
		HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		Map map = new HashMap();
		map.put("u_email", userInfo.get("email"));
		int affectedEm = service.emailCheck(map);
		if(affectedEm == 0) {
			model.addAttribute("nickname",userInfo.get("nickname"));
			model.addAttribute("email",userInfo.get("email"));
			model.addAttribute("id",userInfo.get("id"));
			PrintWriter w = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
	        w.write("<script>alert('"+map.get("u_email")+"님에 대한 회원 정보가 없습니다. 회원가입 페이지로 이동합니다.');"
	        		+ "location.href='/Helltalk/member/CreateUser.do'</script>");
	       
		}
		
	}
	
	@RequestMapping("/CreateUser.do")
	public String createUser() {
		return "member/register/register";
	}
	
	@RequestMapping("/Success.do")
	public String SuccessRegister() {
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
