package com.helltalk.springapp.controller.calendar;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helltalk.springapp.models.CalService;
import com.helltalk.springapp.models.CalcDto;
import com.helltalk.springapp.models.CaldDto;
import com.helltalk.springapp.service.CalcServiceImpl;

@Controller
@RequestMapping("/calc")
public class CalcController {
	
	@Autowired
	private CalService<CalcDto> calcService;
	
	@Autowired
	private CalcServiceImpl calcSevice1;
	
	//운동루틴 값 받기!(던저 줍쇼!!)
	@PostMapping("/Write.do")
	@ResponseBody
	public Map write(@RequestBody Map map) {
		int newcalc = calcService.insert(map); 
		map.put("calcno", newcalc);
		return map;
	}
	

	//상세보기(startdate로 루틴 가져오기!)
	@RequestMapping("/View.do")
	@ResponseBody
	public Map view(@RequestParam Map map,Model model,Authentication auth) {
		map.put("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());
		System.out.println("넘어오는 map"+map);
		
		Map list = calcSevice1.selectOneR(map);
		System.out.println("no가져오기"+list);
	//	model.addAttribute("list",list);
		
		return list;
	}
	
	
	
	
	

}
