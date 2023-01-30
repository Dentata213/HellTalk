package com.helltalk.springapp.controller.map;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.helltalk.springapp.service.LocationDto;
//import com.helltalk.springapp.service.LocationService;





@Controller
@RequestMapping("/map")
public class AddressController {
	
	
	@RequestMapping("/iframMap.do")
	public String ifram() {
		return "/map/Address.helltalk";
	}
	
	
	
		@GetMapping("/address.do")
		public String address() {
			System.out.println("카카오 지도 API 테스트");
			return "/map/Address";
		}
		@GetMapping("/address2.do")
		public String address2() {
			System.out.println("카카오 지도 API 테스트");
			return "/map/Address2";
		}
		@GetMapping("/home.do")
		public String home() {
			System.out.println("카카오 지도 API 테스트");
			return "/map/home";
		}
		@GetMapping("/androidDB.do")
		public String login() {
			System.out.println("카카오 지도 API 테스트");
			return "/map/androidDB";
		}
		@GetMapping("/Map/chicken.do")
		public String chicken() {
			System.out.println("치");
			return "/map/chicken.json";
		}
		
//		
//		@Autowired
//		private LocationService LocationService;
//		
//		//1]
//		@RequestMapping("location.do")
//		public String selectList(float M_XCOORD, float M_YCOORD, int U_NO) {
//			
//			LocationDto l = new LocationDto();
//			l.setM_XCOORD(M_XCOORD);
//			l.setM_YCOORD(M_YCOORD);
//			l.setU_NO(U_NO);
//			
//			int listCount = LocationService.selectListCount(l);
//			
//			// 최초 로그인 시 insert
//			if(listCount == 0) {
//				int result = LocationService.insertCoordinate(l);
//			} else { // 기존 데이터가 있을때 update
//				int result = LocationService.updateCoordinate(l);
//			}
//			
//			return "redirect:/";
//		}
//		
//		//2]
//		@RequestMapping("locationMap.do")
//		public String selectMap() {
//			return "location/location";
//		}
//		
//		//3]
//		@RequestMapping("locationMapList.do")
//		@ResponseBody
//		public String selectMapList() {
//			ArrayList<LocationDto> list = LocationService.selectMapList();
//			
//			String data = "";
//			for(int i=0; i<list.size(); i++) {
//				if(i==0 && list.size()>0) {
//					data = "{\n  \"positions\" : [\n    {\n    \"lng\": "+list.get(i).getM_XCOORD()+",\n    \"lat\": "+list.get(i).getM_YCOORD()+"\n    } ,";
//				} else if(i>0 && i<list.size()-1) {
//					data += " {\n    \"lng\": "+list.get(i).getM_XCOORD()+",\n    \"lat\": "+list.get(i).getM_YCOORD()+"\n    } ,";
//				} else if(i==list.size()-1) {
//					data += " {\n    \"lng\": "+list.get(i).getM_XCOORD()+",\n    \"lat\": "+list.get(i).getM_YCOORD()+"}\n  ]\n}";
//				}
//			}
//			
//			
//			
//			
//	        // 본인 환경에 따라 new File 부분의 경로를 수정 해주세요.
//	        // ex. D:\\test\\resources\\kakaoMap/kakaoMap.json
//		    File myFile = new File("~~~~\\resources\\kakaoMap/kakaoMap.json");
//		    try {
//		    	if(myFile.exists()){
//		    		myFile.delete();
//		    	}
//		    	myFile.createNewFile();
//		        BufferedWriter writer = new BufferedWriter(new FileWriter(myFile));
//		        writer.write(data);
//		        writer.close();
//		    } catch (IOException e) {
//		      e.printStackTrace();
//		      System.out.println("예외 처리");
//		      System.out.println("파일을 처리하는 과정에서 오류가 발생했습니다.");
//		    }
//		    
//			return "";
//		}
//		
//		
//		
		
}
