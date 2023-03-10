package com.helltalk.springapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/model*")
public class ModelController {

	@RequestMapping("/shop-1.do")
	public String handlerMapping() {
		return "payment/shop-1.helltalk";
	}
	
	@RequestMapping("/routine.do")
	public String exerciseRoutine() {
		return "challenge/routine/exerciseRoutine";
	}
	
	@RequestMapping("/ocr.do")
	public String ocr() {
		return "ocr/Ocr";
	}
	
	@RequestMapping("/challengeMain")
	public String challengeMain() {
		return "challenge/ChallengeMain.helltalk";
	}
	
}
