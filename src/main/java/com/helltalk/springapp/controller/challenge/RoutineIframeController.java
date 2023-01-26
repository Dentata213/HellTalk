package com.helltalk.springapp.controller.challenge;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoutineIframeController {

	@RequestMapping("/routine/iframe.do")
	public String exerciseKind(Model model) {
		
		return "challenge/routine/recommendRoutineIframe";
		
	}
}
