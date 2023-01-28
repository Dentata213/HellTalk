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
import java.util.Enumeration;
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
	
	//식품관련 api key
	@Value("${foodSafetyService_Key}")
	private String foodSafetyService_Key;
	
	@Autowired
	private DietServiceImpl dietService;
	@Autowired
	private FoodServiceImpl foodService;
	
	//메인화면 이동(임시)
	@RequestMapping(value= "/main.do")
	public String searchList(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		
		return "challenge/diet/Diet";
	}
	
	//음식 등록
	@PostMapping("/goFoodSearch.do")
	public String goFoodSearch(@RequestParam Map map, HttpServletRequest req, Model model){
		String breakfast= req.getParameter("breakfast")== null? null: req.getParameter("breakfast");
		String lunch= req.getParameter("lunch")== null? null: req.getParameter("lunch");
		String dinner= req.getParameter("dinner")== null? null: req.getParameter("dinner");
		System.out.printf("아침:%s, 점심:%s, 저녁:%s",breakfast,lunch,dinner);
		
		//eat- status 값 받아오기
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
		
		//뷰 반환
		return "challenge/diet/SearchFood";
	}//////////////////////////////////////////goFoodSearch

	
	//음식 검색
	@RequestMapping("/foodSearch.do")
	public String searchFoodList(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		
		String search= req.getParameter("search") == null? "": req.getParameter("search");
		System.out.println("search: "+search);
		
		//검색된 음식을 보여줄 list 생성
		List<FoodDTO> list = new ArrayList<FoodDTO>();
		
		//음식 api를 통한 검색 및 db저장
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
					
					
					//dto를 통해 음식DB에 값 저장
					int selectFoodAffected= foodService.selectFoodAffected(dto);
					System.out.println("selectFoodAffected-"+i+" :"+selectFoodAffected);
					if(selectFoodAffected == 0) {
						//DB에 음식이 없을 경우 새로 저장
						int insertFoodAffected= foodService.insert(dto);
						//System.out.println("insertFoodAffected : "+insertFoodAffected);
						
						//새로 저장한 음식을 보여주기 위한 select
						FoodDTO insertFood= foodService.selectOne(dto);
						//System.out.println("insertFood : "+ insertFood);
					}	
					
				//다음 페이지에 뿌려줄 검색된 음식을 리스트에 담기
				list.add(dto);
				}//for				
			}//if
			else {
				System.out.println("검색결과 없음");
				model.addAttribute("FailSearch", "검색된 결과가 없습니다");
			}
			/*
			//console 테스트용
			for(FoodDTO item : list) {
				
				System.out.println("----------------");
				System.out.println("이름: "+ item.getFood_name());
				System.out.println("1회제공량: "+ item.getFood_size());
				System.out.println("열량: "+ item.getFood_kcal());
				System.out.println("----------------");
				
			}*/
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		model.addAttribute("searchList",list);
		
		//뷰 정보 반환
		return "challenge/diet/SearchFood";
		
	}//////////searchFoodList()
	
	//검색 후 선택한 음식 상세보기
	@RequestMapping("/putFood.do")
	public String putFood(@RequestParam Map map, HttpServletRequest req, Model model) {
		String food_cd = req.getParameter("food_cd")==null? null: req.getParameter("food_cd");
		System.out.println("food_cd넘어왔나 : "+ food_cd);
		
		//선택한 음식(값)을 음식코드로 select를 위해
		map.put("food_cd", food_cd);
		
		FoodDTO selectFood= foodService.foodSelectOneByCd(map);
		System.out.println("선택한 음식 :"+selectFood);
		
		if(selectFood != null)
			model.addAttribute("selectFood", selectFood);
		else {
			model.addAttribute("FailSelect", "값을 가져오지 못했습니다");
		}
		
		//뷰 반환
		return "challenge/diet/SelectFood";
	}
	
	//확인을 하면 eat테이블에 저장
	@RequestMapping("/putFoodByNo.do")
	public String putFoodByNo(@RequestParam Map map, HttpServletRequest req, Model model) {
		String food_cd = req.getParameter("food_cd")==null? null: req.getParameter("food_cd");
		System.out.println("food_cd넘어왔나2 : " + food_cd);
		String breakfast= req.getSession().getAttribute("breakfast") == null? null:req.getSession().getAttribute("breakfast").toString() ;
		String lunch= req.getSession().getAttribute("lunch") == null? null:req.getSession().getAttribute("lunch").toString() ;
		String dinner= req.getSession().getAttribute("dinner") == null? null:req.getSession().getAttribute("dinner").toString() ;
		
		//식사시간구분값을 가져오기 위해
		HttpSession session= req.getSession();
		
	    String statusName = "";
	    String status = "";

	    Enumeration enum_app = session.getAttributeNames();
	    int i = 0;

	    while(enum_app.hasMoreElements()) {
	   
	        i++;
	        statusName = enum_app.nextElement().toString();
	        status = session.getAttribute(statusName).toString();
	   
	        System.out.println("얻어온 세션 이름 [ " + i +" ] : " + statusName);
	        System.out.println("얻어온 세션 값 [ " + i +" ] : " + status);
	        
	        //식사시간구분값 저장
	        if(status.equals("breakfast")& status != null) {
		    	map.put("status", "breakfast");
		    	session.removeAttribute(status);
		    }
		    else if(status.equals("lunch")& status != null) {
		    	map.put("status", "lunch");
		    	session.removeAttribute(status);
		    }
		    else if(status.equals("dinner")& status != null) {
		    	map.put("status", "dinner");
		    	session.removeAttribute(status);
		    }
		    else {
		    	System.out.println("세션에 있는 식사시간 관련 값이 넘어오지 않았습니다 : "+status);
		    }
	    }
	    System.out.println("status 넘어온 값: "+map.get("status"));
	    
	    //DB- Diet 값 저장
	  	//map.put(,);
	  	map.put("u_no", Integer.valueOf(7));
	  		
	  	//DB- Diet테이블 생성(insert) //diet_no
	  	int insertDietAffected = dietService.insert(map);
	  	System.out.println("diet_no : "+insertDietAffected);
		
		//DB- eatList관련 값 저장
	    map.put("food_cd", food_cd);
	    
	    //eatList에 음식 저장
	    int insertEatListAffected= dietService.insertEatList(map);
	    System.out.println("insertEatListAffected : "+insertEatListAffected);
	    
	    
	    
		return "challenge/diet/Diet";
	}

}
