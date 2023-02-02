package com.helltalk.springapp.controller.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.helltalk.springapp.models.PaymentDTO;
import com.helltalk.springapp.service.BBSDto;
import com.helltalk.springapp.service.BBSService;
import com.helltalk.springapp.service.BBSServiceImpl;
import com.helltalk.springapp.service.MemberDTO;
import com.helltalk.springapp.service.MemberServiceImpl;

@Controller
@RequestMapping("/community/bbs")
public class BBSController {
	
	@Autowired
	private BBSServiceImpl service;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	// 게시판 목록 조회
	@RequestMapping("/list")
	public String list(@RequestParam Map map,Model model) throws Exception{
		List<BBSDto> lists = service.selectBBS(map);
		model.addAttribute("lists", lists);
		System.out.println(lists);
		return "community/bbs/List.helltalk";
	}
	
	//게시물 작성
	@RequestMapping("/write")
	public String write(@RequestParam("content") String content,Model model,HttpServletRequest req) throws Exception{
		Map map = new HashMap();
		HttpSession session = req.getSession();
		//map.put("U_NO", session.getAttribute("U_NO"));
		map.put("U_NO",2);
		map.put("P_CONTENT", content);
		int a =service.insertBBS(map);
		System.out.println("ㄴ리ㅏㅓㄴㅇㄹ="+a);
		return "community/bbs/List.helltalk";
	}
	
	@RequestMapping("/movetoEdit")
	public String movetoEdit() {
		return "community/bbs/Edit.helltalk";
	}
	
	//게시물 수정
	@RequestMapping(value = "/edit", produces = "application/josn")
	public String edit(@RequestParam Map map) throws Exception{
		service.editBBS(map);
		return "community/bbs/Edit.helltalk";
	}
	
	//게시물 삭제
	@RequestMapping(value="/delete",method ={RequestMethod.GET,RequestMethod.POST})
	public String delete(@RequestParam Map map) throws Exception{
		service.deleteBBS(map);
		return "community/bbs/List.helltalk";
	}
	
	
	//마이페이지
	@RequestMapping("/mypage")
	public String movetomypage(@RequestParam Map map,Model model, Authentication auth) {
		UserDetails authenticated=(UserDetails)auth.getPrincipal();
		map.put("u_email", authenticated.getUsername());
		List<BBSDto> lists = service.selectBBS(map);
		MemberDTO member = memberService.selectOneByEmail(map);
		model.addAttribute("member", member);
		model.addAttribute("lists", lists);
		return "community/bbs/user-page.helltalk";
	}
	
	//좋아요 카운트
	@RequestMapping("/like")
	public String like(@RequestParam("no") String no,Model model,HttpServletRequest req) {
		
		Map map = new HashMap();
		HttpSession session = req.getSession();
		//map.put("U_NO", session.getAttribute("U_NO"));
		map.put("U_NO",1);
		map.put("P_NO", no);
		service.likeBBS(map);
		
		return "community/bbs/List.helltalk";
	}
	
}

	