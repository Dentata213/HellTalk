package com.helltalk.springapp.controller.challenge.diet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.python.core.PyObject;
import org.python.core.PyString;
import org.python.util.PythonInterpreter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.helltalk.springapp.models.DietDTO;
import com.helltalk.springapp.service.DietServiceImpl;

@Controller
@RequestMapping("/diet")
public class DietController {

	@Autowired
	private DietServiceImpl dietService;
	
	@Autowired
	private RestTemplate restTemplate;
	
	@RequestMapping(value= "/main.do")
	public String searchList(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		
		return "challenge/diet/Diet";
	}
	
	
	
	@GetMapping("/foodSearch.do")
	public String searchFoodList(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		
		String search= req.getParameter("search") == null? "": req.getParameter("search");
		System.out.println("search: "+search);
		
		//요청 Body
		Map<String,List> requestBody = new HashMap<>();
		ObjectMapper mapper = new ObjectMapper();
		HttpEntity entity = new HttpEntity(requestBody);
		String uri="https://openapi.foodsafetykorea.go.kr/api/6a249969337a41998290/I2790/json/1/1000/DESC_KOR="+search;
		ResponseEntity<Map> responseEntity =
				restTemplate.exchange(
						uri,//요청 URI
						HttpMethod.GET,//요청 메소드
						entity,//HttpEntity(요청바디와 요청헤더)
						Map.class//응답 데이타가 {}일때				
						);
		
		Map responsebody = responseEntity.getBody();
		System.out.println(responsebody);
		//NUTR_CONT1
		
		//map.put("search", search);
		model.addAttribute("searchList", responsebody);
		
		//"NUTR_CONT8":"0","NUTR_CONT9":"","NUTR_CONT4":"","NUTR_CONT5":"","NUTR_CONT6":"","NUM":"1","NUTR_CONT7":"","NUTR_CONT1":"132","NUTR_CONT2":"","SUB_REF_NAME":"식약처(\u002719)","NUTR_CONT3":"","RESEARCH_YEAR":"2019","MAKER_NAME":"토프레소","GROUP_NAME":"","SERVING_SIZE":"385","SAMPLING_REGION_NAME":"전국(대표)","SAMPLING_MONTH_CD":"AVG","SAMPLING_MONTH_NAME":"평균","DESC_KOR":"사과 대추 차","SAMPLING_REGION_CD":"ZZ","FOOD_CD":"D012925"
		return "challenge/diet/Diet";
		
	}
	
	/*
	// 목록 처리]
	@RequestMapping(value = "/main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(@RequestParam Map map, HttpServletRequest req, Model model) {
		// 서비스 호출
		List<DietDTO> list = dietService.selectList(map, req);
		// 데이타 저장
		model.addAttribute("list", list);
		// 뷰정보 반환
		return "challenge/diet/Diet";
	}
	*/

}
