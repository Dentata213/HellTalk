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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helltalk.springapp.models.CalService;
import com.helltalk.springapp.models.CaldDto;


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
	
	//일정등록
	@PostMapping("/Write.do")
	@ResponseBody
	public Map write(@RequestBody Map map) {
	 int newcald = caldService.insert(map); //입력한 행의 키 값
	 map.put("caldno", newcald);
	 return map;
	}
	
	//상세보기
	@RequestMapping(value="/View.do")
	@ResponseBody
	public CaldDto view(@RequestParam Map map) {
		CaldDto record=caldService.selectOne(map);
		System.out.println(record.getCald_no());
		return record;
	}
	
	@PostMapping("/Edit.do")
	@ResponseBody
	public Map edit(@RequestBody Map map) {
		caldService.update(map);
		return map;
	}
}
