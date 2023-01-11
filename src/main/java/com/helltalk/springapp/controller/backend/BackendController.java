package com.helltalk.springapp.controller.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helltalk.springapp.service.PaymentServiceImpl;

@Controller
@RequestMapping("/backend")
public class BackendController {
	
	
	//@Autowired//결재 서비스
	private PaymentServiceImpl paymentService;
	//@Autowired//멤버 서비스
	//
	//@Autowired//게시판 서비스
	//
	
	
	
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
		//paymentService.selectReceiptList(null);
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
