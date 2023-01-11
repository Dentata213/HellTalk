package com.helltalk.springapp.controller.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class BBSController {

	@RequestMapping("/bbs/list")
	public String list() {
		
		return "community/bbs/List.helltalk";
	}
}
