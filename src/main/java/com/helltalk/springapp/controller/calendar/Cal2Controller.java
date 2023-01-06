package com.helltalk.springapp.controller.calendar;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RestController;

import com.helltalk.springapp.service.Cal2Dto;
import com.helltalk.springapp.service.CalDto;
import com.helltalk.springapp.service.CalService;


@Controller
@RequestMapping("/fullcal/cal2")
public class Cal2Controller {

	//서비스 주입
	@Autowired
	private CalService<CalDto> calService;
	@Autowired
	private CalService<Cal2Dto> calService2;
		
/*	//목록처리 
	@RequestMapping(value="/List.do",method ={RequestMethod.GET,RequestMethod.POST})
	public String list(
                    @RequestParam Map map,
                    HttpServletRequest req,
                    Model model) {
		List<CalDto> calendarList2 =calService.selectList(map, req);
	
		//데이터 저장	
		model.addAttribute("calendarList2",calendarList2);			
		System.out.println("이건 직접입력");
		//뷰정보반환
		return "monthtest1";
	}*/
	
	
	@PostMapping("/Write.do")
	@ResponseBody 
	public Map write(@RequestBody Map map) {
		int newcal2 = calService2.insert(map);  //입력한 행의 키값!
		map.put("calno2", newcal2);  //이걸 수정/삭제 때 쓸 수 있나..		
		return map;
	}
	
/*	@PostMapping("/Write.do")
	@ResponseBody 
	public Map write(@RequestBody Map map) {
		int newcal = calService.insert(map);  //입력한 행의 키값!
		map.put("calno", newcal);  //이걸 수정/삭제 때 쓸 수 있나..
		System.out.println(newcal);
		System.out.println(map);
		return map;
	}	
	*/
	
	@PostMapping("/View.do")
	@ResponseBody 
	public Cal2Dto view(@RequestParam Map map, Model model) {
			Cal2Dto record= calService2.selectOne(map);
			model.addAttribute("record",record);
			System.out.println(record);
		return record ;
	}
	
	
	@PostMapping("/Edit.do")
	@ResponseBody 
	public Map edit(@RequestBody Map map) {
		int newcal2 = calService2.insert(map);  //입력한 행의 키값!
		map.put("calno2", newcal2);  //이걸 수정/삭제 때 쓸 수 있나..		
		return map;
	}
	
	
	
}
