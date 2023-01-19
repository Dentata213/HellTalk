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
import javax.servlet.http.HttpSession;

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
	
	//
	@PostMapping("/goFoodSearch.do")
	public String goSearchFood(@RequestParam Map map, HttpServletRequest req, Model model){
		String breakfast= req.getParameter("아침")== null? null: req.getParameter("아침");
		String lunch= req.getParameter("점심")== null? null: req.getParameter("점심");
		String dinner= req.getParameter("저녁")== null? null: req.getParameter("저녁");
		System.out.printf("아침:%s, 점심:%s, 저녁:%s",breakfast,lunch,dinner);
		
		if(breakfast != null) {
			HttpSession session = req.getSession();
			session.setAttribute("breakfast", breakfast);
		}
		else if(lunch != null) {
			HttpSession session = req.getSession();
			session.setAttribute("lunch", lunch);
		}
		else if(dinner != null) {
			HttpSession session = req.getSession();
			session.setAttribute("dinner", dinner);
		}
		else {
			System.out.println("아점저 안 넘어옴");
		}
		
		return "challenge/diet/SearchFood";
	}

	
	//검색
	@RequestMapping("/foodSearch.do")
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
					String food_cd= (String)item.get("FOOD_CD");
					String food_name = (String)item.get("DESC_KOR");
					String food_maker = (String)item.get("MAKER_NAME");
					String food_size = (String)item.get("SERVING_SIZE");
					String food_kcal = (String)item.get("NUTR_CONT1");
					String food_tan= (String)item.get("NUTR_CONT2");
					String food_dan= (String)item.get("NUTR_CONT3");
					String food_fat= (String)item.get("NUTR_CONT4");
					String food_col= (String)item.get("NUTR_CONT5");
					String food_na= (String)item.get("NUTR_CONT6");
					
					dto.setFood_cd(food_cd);
					dto.setFood_name(food_name);
					dto.setFood_maker(food_maker);
					dto.setFood_size(food_size);
					dto.setFood_kcal(food_kcal);
					dto.setFood_tan(food_tan);
					dto.setFood_dan(food_dan);
					dto.setFood_fat(food_fat);
					dto.setFood_col(food_col);
					dto.setFood_na(food_na);
					
					
					
					
					int selectOneFood= foodService.selectFoodAffected(dto);
					System.out.println("selectoneFood-"+i+" :"+selectOneFood);
					if(selectOneFood == 0) {
						int insertFoodAffected= foodService.insert(dto);
						System.out.println("insertFoodAffected : "+insertFoodAffected);
						
						FoodDTO insertFood= foodService.selectOne(dto);
						System.out.println("insertFood : "+ insertFood);
					}	
					
					
				list.add(dto);
				}//for				
			}//if
			else {
				System.out.println("검색결과 없음");
				model.addAttribute("FailSearch", "검색된 결과가 없습니다");
			}
			/*
			Map foodMap= new HashMap();
			for(FoodDTO item : list) {
				
				System.out.println("----------------");
				System.out.println("이름: "+ item.getFood_name());
				System.out.println("1회제공량: "+ item.getFood_size());
				System.out.println("열량: "+ item.getFood_kcal());
				System.out.println("----------------");
				
				foodMap.put("food_cd", item.getFood_cd());
				foodMap.put("food_name", item.getFood_name());
				foodMap.put("food_maker", item.getFood_maker());
				foodMap.put("food_size", item.getFood_size());
				foodMap.put("food_kcal", item.getFood_kcal());
				foodMap.put("food_tan", item.getFood_tan());
				foodMap.put("food_dan", item.getFood_dan());
				foodMap.put("food_fat", item.getFood_fat());
				foodMap.put("food_col", item.getFood_col());
				foodMap.put("food_na", item.getFood_na());
			
				
				FoodDTO selectOneFood= foodService.selectOne(foodMap)==null? null: foodService.selectOne(foodMap);
				System.out.println("selectoneFood : "+selectOneFood);
				if(selectOneFood == null) {
					int insertFoodAffected= foodService.insert(foodMap);
					System.out.println("insertFoodAffected : "+insertFoodAffected);
				}
				
				
				
				
			}*/
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		model.addAttribute("searchList",list);
		return "challenge/diet/SearchFood";
		
	}//////////searchFoodList()
	
	@RequestMapping("/putFood.do")
	public String putFood(@RequestParam Map map, HttpServletRequest req, Model model) {
		String food_cd = req.getParameter("food_cd")==null? null: req.getParameter("food_cd");
		System.out.println("food_cd넘어왔나 : "+ food_cd);
		
		map.put("food_cd", food_cd);
		
		FoodDTO selectFood= foodService.foodSelectOneByCd(map);
		System.out.println("선택한 음식 :"+selectFood);
		
		if(selectFood != null)
			model.addAttribute("selectFood", selectFood);
		else {
			model.addAttribute("FailSelect", "값을 가져오지 못했습니다");
		}
		return "challenge/diet/SelectFood";
	}
	
	@RequestMapping("/putFoodByNo.do")
	public String putFoodByNo(@RequestParam Map map, HttpServletRequest req, Model model) {
		String food_cd = req.getParameter("food_cd")==null? null: req.getParameter("food_cd");
		System.out.println("food_cd넘어왔나2 : " + food_cd);
		
		map.put("food_cd", food_cd);

		FoodDTO selectFood = foodService.foodSelectOneByCd(map);
		System.out.println("선택한 음식 :" + selectFood);
		
		int insertFoodAffected= dietService.insert(map);
		
		
		return "challenge/diet/Diet";
	}

}
