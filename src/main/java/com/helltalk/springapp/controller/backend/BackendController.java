package com.helltalk.springapp.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/backend")
public class BackendController {
	@RequestMapping("/admin")
	public String admin() {
		
		return "backend/admin";
	}
}
