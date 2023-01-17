package com.helltalk.springapp.controller.challenge;

import java.util.List;
import java.util.Map;

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


		

//@SessionAttributes("id")
@Controller
@RequestMapping("/exercise")
public class ExerciseKindController {
	
	@Autowired
	private ExerciseServiceImpl exerService;
	
	@GetMapping("/Kind.do")
	public String exerciseKind(@RequestParam Map map,Model model) {
		//System.out.println("컨트롤러");
		
		List<ExerciseDTO> listExerKind= exerService.selectExerciseKindList(map);
		model.addAttribute("listExerKind", listExerKind);
		return "challenge/routine/user_exerciseRoutine.helltalk";
		
	}

}
