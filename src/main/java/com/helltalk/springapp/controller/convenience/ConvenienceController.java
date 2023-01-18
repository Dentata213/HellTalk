package com.helltalk.springapp.controller.convenience;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/convenience")
public class ConvenienceController {
	
	@RequestMapping("/Calculator")
	public String Calculator() {
		
		return "convenience/Calculator.helltalk";
	}
}
