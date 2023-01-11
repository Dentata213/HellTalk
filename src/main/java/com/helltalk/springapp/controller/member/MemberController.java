package com.helltalk.springapp.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.helltalk.springapp.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl service;
	
	@RequestMapping("/register.do")//회원가입 컨트롤러
	public String register(@RequestParam Map map,Model model,HttpServletResponse response) throws IOException {
		int affected = service.idCheck(map);//아이디 서버단에서 중복체크
		if(affected == 0) {
			service.insertUser(map);
			model.addAttribute("nickname",map.get("u_nickname"));
			return "member/register/success.helltalk";
			
		}else {
			String id = (String)map.get("u_id");
			response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	        w.write("<script>alert('"+id+"는 현재 사용중인 아이디 입니다');history.back();</script>");
	        w.close();
	        
		}
		return null;
		
	}
	
	
}
