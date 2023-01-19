package com.helltalk.springapp.controller.challenge;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
		for(Object key:keys) {
			Object value=map.get(key);
			System.out.println(String.format("%s : %s",key,value));
		}
		
		List<Map<String, String>> list =new ArrayList<Map<String,String>>();
		for(int i=1;i<=7;i++) {
			Map<String, String> dayi=new HashMap<String, String>();
			String day="";
			for(int k=1;k<=3;k++) {
				if(map.get("selecBox"+i+"_"+k).toString().equals("운동 선택")) { 
					day+="";
				} 
				else{
					day+=map.get("selecBox"+i+"_"+k)+","; 
				} 
			}
			if(day.length()>=1) { 
				day=day.substring(0, day.length()-1); 
			}
			dayi.put("day"+i, day);
			list.add(dayi);
		}
		System.out.println(list);
		
		int newRoutNo = exerService.insertExerciseRoutine(map);
		System.out.println("newRoutNo"+newRoutNo);
		model.addAttribute("newRoutNo", newRoutNo);
		
		/*
		 * String day1= "";
		 * 
		 * String day3= ""; String day4= ""; String day5= ""; String day6= ""; String
		 * day7= "";
		 * 
		 * 
		 * for(int i=1;i<=3;i++) {
		 * if(map.get("selecBox1_"+i).toString().equals("운동 선택")) { day1+=""; } else{
		 * day1+=map.get("selecBox1_"+i)+","; } } if(day1.length()>=1) {
		 * day1=day1.substring(0, day1.length()-1); } System.out.println(day1);
		 * 
		 * String day2= ""; for(int i=1;i<=3;i++) {
		 * if(map.get("selecBox1_"+i).toString().equals("운동 선택")) { day2+=""; } else{
		 * day2+=map.get("selecBox1_"+i)+","; } } if(day2.length()>=1) {
		 * day2=day2.substring(0, day2.length()-1); } System.out.println(day2);
		 */
		
		//int newRoutNo = exerService.insertExerciseRoutine(map);
		//
		return "#";
		
	}

}
