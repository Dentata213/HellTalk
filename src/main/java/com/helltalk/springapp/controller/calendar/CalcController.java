package com.helltalk.springapp.controller.calendar;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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

@Controller
@RequestMapping("/calc")
public class CalcController {
	
	@Autowired
	private CalService<CalcDto> calcService;
	
	//운동루틴 값 받기!(던저 줍쇼!!)
	@PostMapping("/Write.do")
	@ResponseBody
	public Map write(@RequestBody Map map) {
		int newcalc = calcService.insert(map); 
		map.put("calcno", newcalc);
		return map;
	}
	

}
