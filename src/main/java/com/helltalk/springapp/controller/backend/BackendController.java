package com.helltalk.springapp.controller.backend;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helltalk.springapp.models.PaymentDTO;
import com.helltalk.springapp.service.BBSDto;
import com.helltalk.springapp.service.BackendServiceImpl;
import com.helltalk.springapp.service.ListPagingData;
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
		
		/*
		Authentication auth, @RequestParam Map map, @RequestParam(required = false,defaultValue = "1") int nowPage, HttpServletRequest req, Model model) {
		ListPagingData<BBSDto> listPagingData=  service.selectList(map, req, nowPage);
		model.addAttribute("listPagingData", listPagingData);
		 */
		
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

		return "backend/adminStatus";
	}
	@RequestMapping("/getAdminMembers")
	public @ResponseBody String getAdminMembers() {
		
		return "backend/adminMembers";
	}
	@RequestMapping("/getAdminBBS")
	public @ResponseBody String getAdminBBS() {
		
		return "backend/adminBBS";
	}
	@RequestMapping("/getAdminPayment")
	public @ResponseBody String getAdminPayment() {
		
		return "backend/adminPayment";
	}
	

	@RequestMapping("/updateUserStatus")
	public @ResponseBody String updateUserStatus(@RequestParam Map map) {
		switch(map.get("status").toString()) {
			case "차단":
				map.put("status", 0);
				service.blockUser(map);
				return "차단";
			case "차단해제":
				map.put("status", 1);
				service.blockUser(map);
				return "차단해제";
			case "추방":
				service.kickUser(map);
				return "추방";
		}
		return "";
	}
	
	@RequestMapping("/removeOne")
	public @ResponseBody Integer removeOne(@RequestParam Map map) {
		return service.removeOne(map);
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/design")
	public String design() {
		return "/backend/member/register";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "/backend/default.helltalk";
	}
	
}
