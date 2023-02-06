package com.helltalk.springapp.controller.challenge;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.helltalk.springapp.service.ExerciseDTO;
import com.helltalk.springapp.service.ExerciseServiceImpl;
import com.helltalk.springapp.service.MemberDTO;
import com.helltalk.springapp.service.MemberServiceImpl;

@Controller
@RequestMapping("/routine")
public class RoutineListController {
	
	@Autowired
	private ExerciseServiceImpl exerService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("/List.do")
	public String selectRoutine(@RequestParam Map map,Model model,Authentication auth) {
		//로그인된 u_email을 map에 담음
		map.put("u_email",((UserDetails)auth.getPrincipal()).getUsername().toString());
		System.out.println("u_email"+map.get("u_email"));
		MemberDTO member = memberService.selectOneByEmail(map);
		model.addAttribute("member", member);
		//추천루틴 select
		List<Map> recommendRoutList= exerService.selectRoutine(map);
		System.out.println("recommendRoutList"+recommendRoutList);
		
		
		
		//map에 담긴 값 확인
		/*
		Set keys= map.keySet();
		for(Object key:keys) {
			Object value=map.get(key);
			System.out.println(String.format("%s : %s",key,value));
		}*/
				
		//추천루틴에서 day1~7의 컬럼 데이터를 List<String[]>담아 각 day의 운동명을 split 하여 String[] 배열에 담음
		/*List<String[]> day=new Vector();
		for(Map list:recommendRoutList) {
			for(int i=1;i<=7;i++) {
				if((String)list.get("DAY"+i)!=null){
					String[] arr=((String)list.get("DAY"+i)).split(",");
					System.out.println(list.get("DAY"+i));
					System.out.println("arr"+i+"번째: "+Arrays.toString(arr));
					day.add(arr);
				}
			}
		}
		System.out.println("day.size()"+day.size());
		// String[] 배열에 담겼는지 확인
		for(String[] list:day) {
			System.out.println(Arrays.toString(list));
		}*/
		//System.out.println("recommendRoutList"+recommendRoutList);
		
		model.addAttribute("recommendRoutList", recommendRoutList);
		//model.addAttribute("routine-exercise", day);
		return "challenge/routine/recommend_exerciseRoutine";
	}

}
