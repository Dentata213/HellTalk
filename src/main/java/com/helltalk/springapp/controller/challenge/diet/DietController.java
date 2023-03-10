package com.helltalk.springapp.controller.challenge.diet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
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
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.helltalk.springapp.models.DietDTO;
import com.helltalk.springapp.models.FoodDTO;
import com.helltalk.springapp.service.DietServiceImpl;
import com.helltalk.springapp.service.FoodServiceImpl;

@Controller
@RequestMapping("/diet")
public class DietController {
	
	//???????????? api key
	@Value("${foodSafetyService_Key}")
	private String foodSafetyService_Key;
	
	@Autowired
	private DietServiceImpl dietService;
	@Autowired
	private FoodServiceImpl foodService;
	
	//?????? ??????
	@RequestMapping(value= "/main.do")
	public String searchList(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		
		//???????????? ????????? ????????? ??????
	  	//??????
	  	List<FoodDTO> selectListEatBreakfast= foodService.selectListEatBreakfast(map);
	  	model.addAttribute("selectListEatBreakfast", selectListEatBreakfast);
	  	//??????
	  	List<FoodDTO> selectListEatLunch= foodService.selectListEatLunch(map);
	  	model.addAttribute("selectListEatLunch", selectListEatLunch);
	  	//??????
	  	List<FoodDTO> selectListEatDinner= foodService.selectListEatDinner(map);
	  	model.addAttribute("selectListEatDinner", selectListEatDinner);
	    
		
		//??? ??????
		return "challenge/diet/Diet.helltalk";
	}
	
	//??????-ajax
	@RequestMapping(value= "/selectDate.do")
	@ResponseBody
	public Map<String, Object> selectDate(@RequestBody Map map) throws Exception {
		System.out.println("map ?????? :"+map.get("d_date"));
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		//???????????? ????????? ????????? ??????
	  	//??????
	  	List<FoodDTO> selectListEatBreakfast= foodService.selectListEatBreakfast(map);
	  	returnMap.put("selectListBreakfast", selectListEatBreakfast);
	  	//??????
	  	List<FoodDTO> selectListEatLunch= foodService.selectListEatLunch(map);
	  	returnMap.put("selectListLunch", selectListEatLunch);
	  	//??????
	  	List<FoodDTO> selectListEatDinner= foodService.selectListEatDinner(map);
	  	returnMap.put("selectListDinner", selectListEatDinner);
		
		return returnMap;
	}
	
	//??????-ajax
	@RequestMapping("/deleteFood.do")
	@ResponseBody
	public void deleteFood(@RequestBody Map map) throws Exception {
		System.out.println("?????? delete:"+map.get("delete"));
		System.out.println("?????? ??????: "+map.get("d_date"));
		
		// delete??? ???????????? ?????? ???????????? ????????? ?????? ??????
		if (map.get("delete") != null) {
			int deleteFoodAffeted = foodService.delete(map);
			System.out.println("????????? ?????? ???: "+deleteFoodAffeted);
		}
	}
	
	//?????? ??????
	@PostMapping("/goFoodSearch.do")
	public String goFoodSearch(@RequestParam Map map, HttpServletRequest req, Model model){
		String breakfast= req.getParameter("breakfast")== null? null: req.getParameter("breakfast");
		String lunch= req.getParameter("lunch")== null? null: req.getParameter("lunch");
		String dinner= req.getParameter("dinner")== null? null: req.getParameter("dinner");
		System.out.printf("??????:%s, ??????:%s, ??????:%s",breakfast,lunch,dinner);
		String d_date= req.getParameter("d_date")==null? null: req.getParameter("d_date");
		System.out.println("d_date : "+d_date);
		
		//eat- status ??? ????????????
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
		
		//d_date ??????
		if(d_date != null) {
			HttpSession session = req.getSession();
			session.setAttribute("d_date", d_date);
		}
		
		//??? ??????
		return "challenge/diet/SearchFood.helltalk";
	}//////////////////////////////////////////goFoodSearch

	
	//?????? ??????
	@RequestMapping("/foodSearch.do")
	public String searchFoodList(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		
		String search= req.getParameter("search") == null? "": req.getParameter("search");
		System.out.println("search: "+search);
		
		//????????? ????????? ????????? list ??????
		List<FoodDTO> list = new ArrayList<FoodDTO>();
		
		//?????? api??? ?????? ?????? ??? db??????
		try{
			String encodeFood = URLEncoder.encode(search, "UTF-8");
			
			URL url = new URL("https://openapi.foodsafetykorea.go.kr/api/"+foodSafetyService_Key+"/I2790/json/1/1000/DESC_KOR=%22" + encodeFood + "%22");
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			Object obj = JSONValue.parse(new InputStreamReader(con.getInputStream()));
			
			JSONObject result = (JSONObject)obj;
			JSONObject all = (JSONObject)result.get("I2790");
			String totalCnt = (String)all.get("total_count");
			JSONArray row = (JSONArray)all.get("row");
			
			if(Integer.parseInt(totalCnt) != 0) {
				for(int i = 0; i < row.size(); i++) {
					//??????DTO ??????
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
					
					
					//dto??? ?????? ??????DB??? ??? ??????
					int selectFoodAffected= foodService.selectFoodAffected(dto);
					//System.out.println("selectFoodAffected-"+i+" :"+selectFoodAffected);
					if(selectFoodAffected == 0) {
						//DB??? ????????? ?????? ?????? ?????? ??????
						int insertFoodAffected= foodService.insert(dto);
						//System.out.println("insertFoodAffected : "+insertFoodAffected);
						
						//?????? ????????? ????????? ???????????? ?????? select
						FoodDTO insertFood= foodService.selectOne(dto);
						//System.out.println("insertFood : "+ insertFood);
					}	
					
				//?????? ???????????? ????????? ????????? ????????? ???????????? ??????
				list.add(dto);
				}//for				
			}//if
			else {
				System.out.println("???????????? ??????");
				model.addAttribute("FailSearch", "????????? ????????? ????????????");
			}
			/*
			//console ????????????
			for(FoodDTO item : list) {
				
				System.out.println("----------------");
				System.out.println("??????: "+ item.getFood_name());
				System.out.println("1????????????: "+ item.getFood_size());
				System.out.println("??????: "+ item.getFood_kcal());
				System.out.println("----------------");
				
			}*/
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		model.addAttribute("searchList",list);
		
		//??? ?????? ??????
		return "challenge/diet/SearchFood.helltalk";
		
	}//////////searchFoodList()
	
	//?????? ??? ????????? ?????? ????????????
	@RequestMapping("/putFood.do")
	public String putFood(@RequestParam Map map, HttpServletRequest req, Model model) {
		String food_cd = req.getParameter("food_cd")==null? null: req.getParameter("food_cd");
		System.out.println("food_cd???????????? : "+ food_cd);
		
		//????????? ??????(???)??? ??????????????? select??? ??????
		map.put("food_cd", food_cd);
		
		FoodDTO selectFood= foodService.foodSelectOneByCd(map);
		System.out.println("????????? ?????? :"+selectFood);
		
		if(selectFood != null)
			model.addAttribute("selectFood", selectFood);
		else {
			model.addAttribute("FailSelect", "?????? ?????? ????????? ??????????????????");
		}
		
		//??? ??????
		return "challenge/diet/SelectFood.helltalk";
	}
	
	//????????? ?????? eat???????????? ??????
	@RequestMapping("/putFoodByNo.do")
	public String putFoodByNo(@RequestParam Map map, HttpServletRequest req, Model model,Authentication auth) {
		String food_cd = req.getParameter("food_cd")==null? null: req.getParameter("food_cd");
		System.out.println("food_cd????????????2 : " + food_cd);
		String breakfast= req.getSession().getAttribute("breakfast") == null? null:req.getSession().getAttribute("breakfast").toString() ;
		String lunch= req.getSession().getAttribute("lunch") == null? null:req.getSession().getAttribute("lunch").toString() ;
		String dinner= req.getSession().getAttribute("dinner") == null? null:req.getSession().getAttribute("dinner").toString() ;
		String d_date= req.getSession().getAttribute("d_date")== null? null: req.getSession().getAttribute("d_date").toString();
		
		//???????????????????????? ???????????? ??????
		HttpSession session= req.getSession();
		
	    String statusName = "";
	    String status = "";

	    Enumeration enum_app = session.getAttributeNames();
	    int i = 0;

	    while(enum_app.hasMoreElements()) {
	   
	        i++;
	        statusName = enum_app.nextElement().toString();
	        status = session.getAttribute(statusName).toString();
	   
	        System.out.println("????????? ?????? ?????? [ " + i +" ] : " + statusName);
	        System.out.println("????????? ?????? ??? [ " + i +" ] : " + status);
	        
	        //????????????????????? ??????
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
		    	System.out.println("????????? ?????? ???????????? ?????? ?????? ???????????? ??????????????? : "+status);
		    }
	    }
	    System.out.println("status ????????? ???: "+map.get("status"));
	    
	    map.put("d_date", d_date);
	    session.removeAttribute(d_date);
	    
	    //DB- ?????????(diet???) ??????
	  	//map.put("u_no", Integer.valueOf(8));//??????
	    map.put("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());
	    System.out.println("uemail :"+map.get("uemail"));
	    
	  	//DB- eatList?????? ??? ??????
	    map.put("food_cd", food_cd);
	    //System.out.println("food_cd:"+food_cd);
	    
	    //diet_no count(*)
	    int selectCountByNo= dietService.selectCountByNo(map);
	    System.out.println("selectCountByNo : "+selectCountByNo);
	    
	    if(selectCountByNo < 1) {
	    	//DB- diet ??????(insert)
		  	int insertDietAffected = dietService.insert(map);
		  	System.out.println("diet????????? insert : "+insertDietAffected);
	    }
	    else {
	    	//diet_no
	    	int selectDietNo= dietService.selectDietNo(map);
	    	map.put("diet_no", selectDietNo);
	    }
	    
	    //diet_no ??????
	    System.out.println("diet_no : "+map.get("diet_no"));
	    
	    //eat????????? ??????
	  	int insertEatAffected= dietService.insertEat(map);
	  	System.out.println("eat_no : "+map.get("eat_no"));
	  	
	  	int insertEatlistAffected= dietService.insertEatList(map);
	  	System.out.println("eatlist????????? insert:"+insertEatlistAffected);
	    
	    //???????????? ????????? ????????? ??????
	  	//??????
	  	List<FoodDTO> selectListEatBreakfast= foodService.selectListEatBreakfast(map);
	  	model.addAttribute("selectListEatBreakfast", selectListEatBreakfast);
	  	//??????
	  	List<FoodDTO> selectListEatLunch= foodService.selectListEatLunch(map);
	  	model.addAttribute("selectListEatLunch", selectListEatLunch);
	  	//??????
	  	List<FoodDTO> selectListEatDinner= foodService.selectListEatDinner(map);
	  	model.addAttribute("selectListEatDinner", selectListEatDinner);
	    
		return "challenge/diet/Diet.helltalk";
	}

}
