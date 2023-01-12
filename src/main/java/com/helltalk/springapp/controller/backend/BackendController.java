package com.helltalk.springapp.controller.backend;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.helltalk.springapp.service.BackendServiceImpl;


@Controller
@RequestMapping("/backend")
public class BackendController {
	
	
	//@Autowired
	private BackendServiceImpl service;

	
	@RequestMapping("/admin")
	public String admin() {
		
		return "backend/admin";
	}
	@RequestMapping("/adminStatus")
	public String adminStatus() {

		return "backend/Status";
	}
	@RequestMapping("/adminMembers")
	public String adminMembers() {

		return "backend/member/AdminMembers";
	}
	@RequestMapping("/adminBBS")
	public String adminBBS() {

		return "backend/bbs/AdminBBS";
	}
	@RequestMapping("/adminPayment")
	public String adminPayment() {
		//service.selectAllReceipt();
		return "backend/payment/AdminPayment";
	}

	
	//ajax요청
	@RequestMapping("/getAdminStatus")
	public @ResponseBody String getAdminStatus() {

		return "/backend/adminStatus";
	}
	@RequestMapping("/getAdminMembers")
	public @ResponseBody String getAdminMembers() {
		
		return "/backend/adminMembers";
	}
	@RequestMapping("/getAdminBBS")
	public @ResponseBody String getAdminBBS() {
		
		return "/backend/adminBBS";
	}
	@RequestMapping("/getAdminPayment")
	public @ResponseBody String getAdminPayment() {
		
		return "/backend/adminPayment";
	}
	
	
	
	
}
