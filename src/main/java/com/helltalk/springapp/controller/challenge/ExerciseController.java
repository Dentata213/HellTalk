package com.helltalk.springapp.controller.challenge;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.helltalk.springapp.service.ExerciseDTO;
import com.helltalk.springapp.service.ExerciseServiceImpl;

@RestController
public class ExerciseController {
	
	@Autowired
	private ExerciseServiceImpl exerService;
	
	@PostMapping("/exercise.do")
	@ResponseBody
	public List<ExerciseDTO> exerciseKind(@RequestParam Map map) {
		List<ExerciseDTO> listExer;
		System.out.println("exercise컨트롤러");
		System.out.println("map.get(\"ek_no\")"+map.get("ek_no"));
		int ek_no=Integer.parseInt((String) map.get("ek_no"));
		if(ek_no==1) {
			System.out.println("ek_no"+ek_no);
			listExer= exerService.selectExerciseList(map);
		}
		else {
			listExer= exerService.selectExerciseListByKind(map);
		}
		//map.put("data", listExer);
		return listExer;
		
	}

}
