package com.helltalk.springapp.controller.challenge;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.helltalk.springapp.service.ExerciseDTO;
import com.helltalk.springapp.service.ExerciseServiceImpl;

@CrossOrigin(origins ="*", methods = RequestMethod.POST)
@RestController
public class DayRoutineController {
	
	
	@Autowired
	private ExerciseServiceImpl exerService;
	
	@RequestMapping(value="/dayroutine.do")
	@CrossOrigin(origins = "*", methods = RequestMethod.POST) 	
	public List<ExerciseDTO> exercise(@RequestParam Map map) {
		List<ExerciseDTO> listDayRoutine;
		System.out.println("dayroutine컨트롤러");

		System.out.println("map.get(\"rout_no\")"+map.get("rout_no"));
		listDayRoutine= exerService.selectDayRoutine(map);
		
		for(int i=0;i<listDayRoutine.size();i++) {
			System.out.println("listDayRoutine.get(i).toString() "+listDayRoutine.get(i).toString());
		}
		
		

		return listDayRoutine;
		
	}
	
	@RequestMapping(value="/dayExercise.do")
	@CrossOrigin(origins = "*", methods = RequestMethod.POST) 	
	public List<ExerciseDTO> dayExercise(@RequestParam Map map) {
		List<ExerciseDTO> listDayExer;
		System.out.println("dayroutine컨트롤러");

		//System.out.println("map.get(\"rout_no\")"+map.get("rout_no"));
		listDayExer= exerService.selectExerList(map);
		
		for(int i=0;i<listDayExer.size();i++) {
			System.out.println("listDayExer.get(i).toString() "+listDayExer.get(i).toString());
		}
		
		

		return listDayExer;
		
	}
	

}
