package com.helltalk.springapp.controller.challenge;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.helltalk.springapp.service.ExerciseDTO;
import com.helltalk.springapp.service.ExerciseServiceImpl;

@Controller

public class exerciseIframeController {
	

	
	
	@RequestMapping("/exercise/iframe.do")
	public String exerciseKind() {
		
		return "challenge/routine/userExerciseRoutine.helltalk";
		
	}

}
