package com.helltalk.springapp.controller.challenge;

import java.util.List;
import java.util.Map;

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
		List<ExerciseDTO> recommendRoutList= exerService.selectExerciseRoutine(map);
		
		model.addAttribute("recommendRoutList", recommendRoutList);
		
		return "challenge/routine/recommend_exerciseRoutine";
	}

}
