package com.helltalk.springapp.controller.teachable;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		return "/teachable/AiFitnessTrainer.helltalk";
	}
	
	//스쿼트
	@RequestMapping("/squat.do")
	public String Squat(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		//뷰 반환
		return "/teachable/Squat.helltalk";
	}
	
	//런지
	@RequestMapping("/lunge.do")
	public String Lunge(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		//뷰 반환
		return "/teachable/Lunge.helltalk";
	}
	
	//버피
	@RequestMapping("/burpee.do")
	public String Burpee(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		//뷰 반환
		return "/teachable/Burpee.helltalk";
	}
	
	@RequestMapping("/result.do")
	public String Result(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		//뷰 반환
		return "/teachable/ResultPage.helltalk";
	}
	
	
	
}
