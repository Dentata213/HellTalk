package com.helltalk.springapp.controller.community;

import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.helltalk.springapp.models.PaymentDTO;
import com.helltalk.springapp.service.BBSDto;
import com.helltalk.springapp.service.BBSService;
import com.helltalk.springapp.service.BBSServiceImpl;

@Controller
@RequestMapping("/community/bbs")
public class BBSController {
	
	@Autowired
	private BBSServiceImpl service;
	
	// 게시판 목록 조회
	@RequestMapping("/list")
	public String list(@RequestParam Map map,Model model) throws Exception{
		List<BBSDto> lists = service.selectBBS(map);
		model.addAttribute("lists", lists);
		System.out.println(lists);
		return "community/bbs/List.helltalk";
		
	}

}
