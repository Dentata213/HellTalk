package com.helltalk.springapp.controller.calendar;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.helltalk.springapp.service.CalService;
import com.helltalk.springapp.service.CaldDto;


@Controller
@RequestMapping("/cal")
public class CalController {
	
	//Dto 주입
	@Autowired
	private CalService<CaldDto> caldService;
	
	//목록처리
	@RequestMapping(value="/List.do",method ={RequestMethod.GET,RequestMethod.POST})
	public String list(
			@RequestParam Map map,
			HttpServletRequest req,
			Model model ) {
		List<CaldDto> caldList =caldService.selectList(map, req);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		//데이터 저장
		model.addAttribute("today",dateFormat.format(new Date()));	
		model.addAttribute("caldList",caldList);
		System.out.println("여기지나니?");
		//뷰정보반환
		return "calendar/Month";
	}
}
