package com.helltalk.springapp.controller.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qna")
public class QNAController {
	
	
	@RequestMapping("/list")
	public String list() {
		
		return "qna/QnA.helltalk";
	}
	
}
