package com.helltalk.springapp.controller.calendar;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
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


@Controller
@RequestMapping("/cal")
public class CalController {
	
	
	//Dto 주입
	@Autowired
	private CalService<CaldDto> caldService;
	
	@Autowired
	private CalService<CalcDto> calcService;
	
	
	@RequestMapping("/ifram.do")
	public String ifram(Map map,Authentication auth,HttpServletRequest req) {	
		return "calendar/IframMon.helltalk";
	}

	
	//목록처리
	@RequestMapping(value="/List.do",method ={RequestMethod.GET,RequestMethod.POST})
	public String list(
			@RequestParam Map map,
			HttpServletRequest req,
			Model model,
			Authentication auth) {
	
		List<CaldDto> caldList =caldService.selectList(map,req);
		List<CalcDto> calcList =calcService.selectList(map,req);
			
						
		map.put("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());
		caldList = caldService.selectList(map,req);
		calcList = calcService.selectList(map,req);	
			
		///풀캘린더 enddate 설정이 하루 전으로 나와서 날짜 하루 더하기...
		String sdate = null;
			for(CalcDto c: calcList) {
			sdate= c.getRout_enddate().toString();		
			long fTime = 0;
			long poneday =0;
			SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date ddate = simple.parse(sdate);
				 fTime = ddate.getTime();
				poneday = 24*60*60*1000;		      
			   } catch (ParseException e) {}	
		   String day = simple.format((new Date(fTime+poneday)));
		   java.sql.Date ffdate = java.sql.Date.valueOf(day);
		    c.setRout_enddate(ffdate);
		//    System.out.println(ffdate);
	 }
		
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");	
		//데이터 저장
		model.addAttribute("today",dateFormat.format(new Date()));	
		model.addAttribute("caldList",caldList);
		model.addAttribute("calcList",calcList);
		model.addAttribute("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());
		System.out.println(model);		
		System.out.println("id"+((UserDetails)auth.getPrincipal()).getUsername().toString());
		
		//뷰정보반환
		return "calendar/Month";
	}
	
	//일정등록
	@PostMapping("/Write.do")
	@ResponseBody
	public Map write(@RequestBody Map map) {
	 int newcald = caldService.insert(map); //입력한 행의 키 값
	 map.put("caldno", newcald);
	 System.out.println("아이디!!"+map);
	 return map;
	}
	
	//상세보기
	@RequestMapping(value="/View.do")
	@ResponseBody
	public CaldDto view(@RequestParam Map map) {
		CaldDto record=caldService.selectOne(map);
		System.out.println("no가져오기"+record.getCald_no());
		return record;
	}
	
	@PostMapping("/Edit.do")
	@ResponseBody
	public Map edit(@RequestBody Map map) {
		caldService.update(map);
		System.out.println("수정"+map);
		return map;
	}
	
	//삭제하기
	@RequestMapping(value="/Delete.do",method ={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map delete(@RequestParam Map map) {
		System.out.println("컨트롤러:"+map);
		caldService.delete(map);
		return map;
	}
	
}
