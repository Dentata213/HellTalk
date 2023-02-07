package com.helltalk.springapp.controller.challenge;

import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.helltalk.springapp.service.CalcServiceImpl;
import com.helltalk.springapp.service.ExerciseDTO;
import com.helltalk.springapp.service.ExerciseServiceImpl;

@Controller
@RequestMapping("/exercise")
public class RoutineController {
	
	@Autowired
	private ExerciseServiceImpl exerService;
	
	@Autowired
	private CalcServiceImpl calcSevice;
	
	@PostMapping("/routine.do")
	public ModelAndView insertExerciseRoutine(@RequestParam Map map,Model model) {
		System.out.println("루틴컨트롤러");
		
		
		
		//총 운동 시간 구하기
		int rout_time=0;//총 운동시간
		for(int i=1;i<=7;i++) {
			for(int k=1;k<=3;k++) {
				if(map.get("time"+i+"_"+k).toString().equals("시간 선택")) { 
					rout_time+=0;
				}
				else {
					rout_time+=Integer.parseInt(map.get("time"+i+"_"+k).toString()) ;
				}
				
			}
		}
		
		map.put("rout_time", rout_time);
		
		//루틴 테이블 생성
		int rout_no =exerService.insertRoutine(map);
		System.out.println("rout_no"+rout_no);
		
		//데이 루틴 테이블 생성
		for(int i=1;i<=7;i++) {
			//일차의 첫번째 운동이 운동선택일 때는 dayloutine 테이블 저장x
			if(!map.get("selecBox"+i+"_1").toString().equals("운동 선택")) { 
				System.out.println("????");
				map.put("day", i);
				System.out.println("map.get('day')"+map.get("day"));
				int dr_no=exerService.insertDayRoutine(map);
			}
			//운동리스트 테이블 생성
			for(int k=1;k<=3;k++) {
				//운동당 시간
				if(!map.get("selecBox"+i+"_"+k).toString().equals("운동 선택")) {
					map.put("e_no",map.get("selecBox"+i+"_1"));
					map.put("el_dayno", k);
					map.put("el_time", Integer.parseInt(map.get("time"+i+"_"+k).toString()));
					System.out.println("map.get(\"e_no\")"+map.get("e_no"));
					System.out.println("map.get(\"el_dayno\")"+map.get("el_dayno"));
					System.out.println("map.get(\"el_time\")"+map.get("el_time"));
					exerService.insertExerList(map);
				}
				
			}
		}
		
		
		//rout_no로 calcheck테이블 값 select
		Map oneCalc=calcSevice.selectOneCalcnoByRoutno(map);
		
		
		
		//map에 담긴 값 확인
		Set keys= map.keySet();
		for(Object key:keys) {
			Object value=map.get(key);
			System.out.println(String.format("%s : %s",key,value));
		}
		
		
		ModelAndView mav = new ModelAndView();
		RedirectView view = new RedirectView();		
		mav.addObject("newRoutNo", oneCalc);
		view.setUrl("/cal/List.do");
		view.setContextRelative(true);///ViewResolver/Continues.do를 상대주소로 설정 
		mav.setView(view);
		return mav;
		
		
	}

}
