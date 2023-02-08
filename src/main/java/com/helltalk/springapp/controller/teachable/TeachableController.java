package com.helltalk.springapp.controller.teachable;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/teachable")
public class TeachableController {
	
	@RequestMapping("/aiFitnessTrainer.do")
	public String Main(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception{
		
		//뷰 반환
		return "/teachable/AiFitnessTrainer";
	}
	
	@RequestMapping("/gameResult.do")
	public String gameResult(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		
		//뷰 반환
		return "/teachable/ResultPage";
	}
	
	
	
}
