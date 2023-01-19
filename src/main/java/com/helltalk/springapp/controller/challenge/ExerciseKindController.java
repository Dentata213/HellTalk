package com.helltalk.springapp.controller.challenge;

import java.util.List;
import java.util.Map;

import org.apache.catalina.tribes.membership.MemberImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.helltalk.springapp.service.ExerciseDTO;
import com.helltalk.springapp.service.ExerciseService;
import com.helltalk.springapp.service.ExerciseServiceImpl;
import com.helltalk.springapp.service.MemberDTO;
import com.helltalk.springapp.service.MemberServiceImpl;


		

//@SessionAttributes("id")
@Controller
@RequestMapping("/exercise")
public class ExerciseKindController {
	
	@Autowired
	private ExerciseServiceImpl exerService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("/Kind.do")
	public String exerciseKind(@RequestParam Map map,Model model) {
		//System.out.println("컨트롤러");
		map.put("u_no", 1);
		MemberDTO member = memberService.selectOne(map);
		model.addAttribute("member", member);
		List<ExerciseDTO> listExerKind= exerService.selectExerciseKindList(map);
		model.addAttribute("listExerKind", listExerKind);
		//model.addAttribute("u_id","KIM");
		return "challenge/routine/user_exerciseRoutine";
		
	}

}
