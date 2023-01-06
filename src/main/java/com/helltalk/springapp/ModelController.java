package com.helltalk.springapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/model*")
public class ModelController {

	@RequestMapping("/shop-2.do")
	public String handlerMapping() {
		return "payment/shop-2.helltalk";
	}
	
	@RequestMapping("/routine.do")
	public String exerciseRoutine() {
		return "challenge/routine/exerciseRoutine";
	}
	
	@RequestMapping("/ocr.do")
	public String ocr() {
		return "ocr/Ocr";
	}
	
	
}
