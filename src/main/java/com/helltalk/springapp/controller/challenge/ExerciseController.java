package com.helltalk.springapp.controller.challenge;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.helltalk.springapp.service.ExerciseDTO;
import com.helltalk.springapp.service.ExerciseServiceImpl;

@RestController
public class ExerciseController {
	
	@Autowired
	private ExerciseServiceImpl exerService;
	
	@PostMapping("/exercise.do")
	public Map exerciseKind(@RequestParam Map map) {
		System.out.println("exercise컨트롤러");
		System.out.println("map.get(\"ek_no\")"+map.get("ek_no"));
		List<ExerciseDTO> listExer= exerService.selectExerciseList(map);
		map.put("listExer", listExer);
		return map;
		
	}

}
