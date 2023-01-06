package com.helltalk.springapp.controller.calendar;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helltalk.springapp.service.Cal2Dto;
import com.helltalk.springapp.service.CalDto;
import com.helltalk.springapp.service.CalService;
import com.zaxxer.hikari.HikariDataSource;

@Controller
@RequestMapping("/fullcal/cal")
public class CalController {

	
	//서비스 주입
	@Autowired
	private CalService<CalDto> calService;
	
	@Autowired
	private CalService<Cal2Dto> calService2;
	
	//목록처리 
	@RequestMapping(value="/List.do",method ={RequestMethod.GET,RequestMethod.POST})
	public String list(
                    @RequestParam Map map,
                    HttpServletRequest req,
                    Model model) {
		List<CalDto> calendarList =calService.selectList(map, req);
		List<Cal2Dto> calendarList2 =calService2.selectList(map, req);
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		
		//데이터 저장
		model.addAttribute("today",dateFormat1.format(new Date()));			
		model.addAttribute("calendarList",calendarList);			
		model.addAttribute("calendarList2",calendarList2);	
		//뷰정보반환
		return "monthtest1";
	}
	
/*	@PostMapping("/Write.do")
	@ResponseBody 
	public Map write(@RequestBody Map map) {
		int newcal2 = calService2.insert(map);  //입력한 행의 키값!
		map.put("calno2", newcal2);  //이걸 수정/삭제 때 쓸 수 있나..		
		return map;
	}
*/	
	@PostMapping("/Delete.do")
	@ResponseBody 
	public Map delete(@RequestBody Map map) {
		int newcal2 = calService2.insert(map);  //입력한 행의 키값!
		map.put("calno2", newcal2);  //이걸 수정/삭제 때 쓸 수 있나..
		return map;
	}
	
	
	
	

}
