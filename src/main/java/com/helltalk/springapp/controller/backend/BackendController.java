package com.helltalk.springapp.controller.backend;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helltalk.springapp.models.PaymentDTO;
import com.helltalk.springapp.service.BBSDto;
import com.helltalk.springapp.service.BackendServiceImpl;
import com.helltalk.springapp.service.MemberDTO;


@Controller
@RequestMapping("/backend")
public class BackendController {
	
	
	@Autowired
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
	public String adminMembers(@RequestParam Map map, Model model) {
		List<MemberDTO> userlists = service.selectAllUser(map);
		model.addAttribute("userlists",userlists);
		return "backend/member/AdminMembers";
	}
	@RequestMapping("/adminBBS")
	public String adminBBS(@RequestParam Map map, Model model) {
		List<BBSDto> bbslists = service.selectAllWritings(map);
		model.addAttribute("bbslists",bbslists);
		return "backend/bbs/AdminBBS";
	}
	@RequestMapping("/adminPayment")
	public String adminPayment(@RequestParam Map map, Model model) {
		List<PaymentDTO> paymentlists = service.selectAllReceipt(map);
		model.addAttribute("paymentlists",paymentlists);
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
	
	@RequestMapping("/blockUser")
	public @ResponseBody int blockUser(@RequestParam Map map) {
		return service.blockUser(map);
	}
	
	
	
}
