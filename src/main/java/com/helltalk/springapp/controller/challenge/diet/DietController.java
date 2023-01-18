package com.helltalk.springapp.controller.challenge.diet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.helltalk.springapp.models.FoodDTO;
import com.helltalk.springapp.service.DietServiceImpl;
import com.helltalk.springapp.service.FoodServiceImpl;

@Controller
@RequestMapping("/diet")
public class DietController {
	
	@Value("${foodSafetyService_Key}")
	private String foodSafetyService_Key;
	
	@Autowired
	private DietServiceImpl dietService;
	@Autowired
	private FoodServiceImpl foodService;
	
	@RequestMapping(value= "/main.do")
	public String searchList(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		
		return "challenge/diet/Diet";
	}
	
	
	//검색
	@GetMapping("/foodSearch.do")
	public String searchFoodList(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		
		String search= req.getParameter("search") == null? "": req.getParameter("search");
		System.out.println("search: "+search);
		
		List<FoodDTO> list = new ArrayList<FoodDTO>();
		
		try{
			String encodeFood = URLEncoder.encode(search, "UTF-8");
			
			URL url = new URL("https://openapi.foodsafetykorea.go.kr/api/"+foodSafetyService_Key+"/I2790/json/1/1000/DESC_KOR=%22" + encodeFood + "%22");
			//19edad5b93f84a0184ce
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			Object obj = JSONValue.parse(new InputStreamReader(con.getInputStream()));
			
			JSONObject result = (JSONObject)obj;
			
			JSONObject all = (JSONObject)result.get("I2790");
			//System.out.println("all: "+all);
			
			String totalCnt = (String)all.get("total_count");
			//System.out.println("totalCnt: "+totalCnt);
			
			JSONArray row = (JSONArray)all.get("row");
			//System.out.println("row: "+row);
			
			
			if(Integer.parseInt(totalCnt) != 0) {
				for(int i = 0; i < row.size(); i++) {
					FoodDTO dto= new FoodDTO();
					
					JSONObject item = (JSONObject)row.get(i);
					String food_no = (String)item.get("NUM");
					String food_name = (String)item.get("DESC_KOR");
					String food_maker = (String)item.get("MAKER_NAME");
					String food_size = (String)item.get("SERVING_SIZE");
					String food_kcal = (String)item.get("NUTR_CONT1");
					String food_tan= (String)item.get("NUTR_CONT2");
					String food_dan= (String)item.get("NUTR_CONT3");
					String food_fat= (String)item.get("NUTR_CONT4");
					String food_col= (String)item.get("NUTR_CONT5");
					String food_na= (String)item.get("NUTR_CONT6");
					
					dto.setFood_no(food_no);
					dto.setFood_name(food_name);
					dto.setFood_maker(food_maker);
					dto.setFood_size(food_size);
					dto.setFood_kcal(food_kcal);
					dto.setFood_tan(food_tan);
					dto.setFood_dan(food_dan);
					dto.setFood_fat(food_fat);
					dto.setFood_col(food_col);
					dto.setFood_na(food_na);
					
					list.add(dto);
				}//for				
			}//if
			else {
				System.out.println("검색결과 없음");
				model.addAttribute("FailSearch", "검색된 결과가 없습니다");
			}
			/*
			for(DietBrieflyDTO item : list) {
				System.out.println("----------------");
				System.out.println("이름: "+ item.getFood_name());
				System.out.println("1회제공량: "+ item.getFood_size());
				System.out.println("열량: "+ item.getFood_kcal());
				System.out.println("----------------");
			}*/
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		model.addAttribute("searchList",list);
		return "challenge/diet/Diet";
		
	}//////////searchFoodList()
	
	@GetMapping("/putFood.do")
	public String putFood(@RequestParam Map map, HttpServletRequest req, Model model) {
		System.out.println("putFood Map?:"+map);
		
		int insetFood= foodService.insert(map);
		
		
		return "challenge/diet/selectFood";
	}
		

}
