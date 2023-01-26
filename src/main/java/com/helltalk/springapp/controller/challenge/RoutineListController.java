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
	public String selectExerciseRoutine(@RequestParam Map map,Model model,Authentication auth) {
		map.put("u_email",((UserDetails)auth.getPrincipal()).getUsername().toString());
		System.out.println("u_email"+map.get("u_email"));
		MemberDTO member = memberService.selectOneByEmail(map);
		model.addAttribute("member", member);
		List<Map> recommendRoutList= exerService.selectExerciseRoutine(map);
		System.out.println("recommendRoutList"+recommendRoutList);
		List<String[]> day=new Vector();
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
		for(String[] list:day) {
			System.out.println(Arrays.toString(list));
		}
		
		model.addAttribute("recommendRoutList", recommendRoutList);
		
		return "challenge/routine/recommend_exerciseRoutine";
	}

}
