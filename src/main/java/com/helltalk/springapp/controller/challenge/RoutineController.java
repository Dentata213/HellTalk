package com.helltalk.springapp.controller.challenge;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.helltalk.springapp.service.ExerciseDTO;
import com.helltalk.springapp.service.ExerciseServiceImpl;

@Controller
@RequestMapping("/exercise")
public class RoutineController {
	
	@Autowired
	private ExerciseServiceImpl exerService;
	
	@PostMapping("/routine.do")
	public String insertExerciseRoutine(@RequestParam Map map,Model model) {
		System.out.println("루틴컨트롤러");
		
		Set keys= map.keySet();
		//STEP2]확장 for문 적용해서 키값 가져오기	
		for(Object key:keys) {
		//STEP3] get(키값)으로 Value값 얻기
			Object value=map.get(key);
			System.out.println(String.format("%s : %s",key,value));
		}
		
		
		//int newRoutNo = exerService.insertExerciseRoutine(map);
		//model.addAttribute("newRoutNo", newRoutNo);
		return "#";
		
	}

}
