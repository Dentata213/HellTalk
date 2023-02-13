package com.helltalk.springapp.controller.payment;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.helltalk.springapp.models.PaidDTO;
import com.helltalk.springapp.models.PaymentDTO;
import com.helltalk.springapp.service.PaymentServiceImpl;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;


@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Value("${application_id}")//properties 설정한 application_id 가져오기
	private String application_id;
	@Value("${private_key}")//properties 설정한 private_key 가져오기
	private String private_key;

	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private PaymentServiceImpl service;
	
	//아임포트 키값
	private IamportClient api;
	
	@Value("${imp_key}")
	private String imp_key;

	@Value("${imp_secret}")
	private String imp_secret;
		
	
	@ResponseBody
	@RequestMapping(value="/verifyIamport")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			,@RequestBody Map map) throws IamportResponseException, IOException{	
		
		System.out.println("locale에 담긴 정보:"+locale);
		System.out.println("session에 담긴 정보:"+session);
		System.out.println("Map에 담긴 정보"+map);
		System.out.println("Map에 담긴 정보imp_uid :"+map.get("imp_uid"));
		System.out.println("Map에 담긴 정보merchant_uid :"+map.get("merchant_uid"));
		
		String imp_uid = (String)map.get("imp_uid");
		
		PaymentController payment = new PaymentController();
		
		api = new IamportClient(imp_key,imp_secret);
		
		String token=service.getToken();
		
		System.out.println("token값 :"+token);
		System.out.println("api값 :"+ api);
			
		return api.paymentByImpUid(imp_uid);
	}
	
	
	
	
	@RequestMapping("/mycart")
	public String mycart(@RequestParam Map map, Model model) {
		
		List<PaymentDTO> lists = service.selectCartList(map);
		int sum = service.calcCart(map);
		
		model.addAttribute("lists", lists);
		model.addAttribute("totalprice",sum);
		
		/*문자열을 4000자씩 쪼개기*/
		String text="BASE64로 변환된 문자열";
		List BASE64 = new Vector<>(); 
		int maxLength = 3999;
		int textLen = text.length();
		int loopCnt = textLen / maxLength + 1;
		String rssTitles = ""; 
		for (int i = 0; i < loopCnt; i++) {
		  int lastIndex = (i + 1) * maxLength; 
		  if(textLen > lastIndex){
		    rssTitles = text.substring(i * maxLength, lastIndex);
		  }else{
		    rssTitles = text.substring(i * maxLength);
		  }
		  BASE64.add(rssTitles);
		}
		model.addAttribute("BASE64", BASE64);
		/*문자열을 4000자씩 쪼개기*/
		
		return "payment/cart.helltalk";
	}
		
	
	@RequestMapping("/single-product")
	public String singleProduct() {
		
		return "payment/single-product.helltalk";
	}
	
	
	@RequestMapping("/checkout")
	public String checkout() {
		
		
		return "payment/checkout.helltalk";
	}
	
	
	@RequestMapping("/add-cart")
	public String addcart(@RequestParam Map map,Model model) {
		//service.insertCart(map);
		return "payment/cart.helltalk";
	}
	
	
	@RequestMapping("/getToken.do")//토큰가져오기
	public String getToken() {
		Map<String,List> requestBody = new HashMap<>();
		ObjectMapper mapper = new ObjectMapper();
		
		String json = String.format("{\r\n"
				+ "    \"application_id\":\"%s\",\r\n"
				+ "    \"private_key\":\"%s\"\r\n"
				+ "}",application_id,private_key);
		
		try {
			requestBody = mapper.readValue(json, Map.class);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		HttpEntity entity = new HttpEntity(requestBody);
		String uri="https://api.bootpay.co.kr/v2/request/token";
		ResponseEntity<Map> responseEntity =
				restTemplate.exchange(
						uri,//요청 URI
						HttpMethod.POST,//요청 메소드
						entity,//HttpEntity(요청바디와 요청헤더)
						Map.class//응답 데이타가 {}일때				
						);
		
		Map responsebody = responseEntity.getBody();
		System.out.println(responsebody.get("access_token"));
		//토큰얻기 끝//
		return null;
	}
	
	@RequestMapping("/getOnePayment.do")//영수증으로 하나의 결재정보 가져오기
	public String getOnePayment() {
		String access_token="";//토큰 필요
		String receiptID="";//영수증ID 필요, 영수증 ID 얻어와야됨
		//접근 방식? 토큰 생성을 거쳐서 오는방법으로 해야될거 같은데
		
		
		//요청 Hedder
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer "+access_token);
		headers.add("Accept", "application/json");
		//요청 Body
		Map<String,List> requestBody = new HashMap<>();
		ObjectMapper mapper = new ObjectMapper();
		
		String json = String.format("{\r\n"
				+ "    \"application_id\":\"%s\",\r\n"
				+ "    \"private_key\":\"%s\"\r\n"
				+ "}",application_id,private_key);
		
		try {
			requestBody = mapper.readValue(json, Map.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		HttpEntity entity = new HttpEntity(headers);
		String uri="https://api.bootpay.co.kr/v2/receipt/"+receiptID;
		ResponseEntity<Map> responseEntity =
				restTemplate.exchange(
						uri,//요청 URI
						HttpMethod.GET,//요청 메소드
						entity,//HttpEntity(요청바디와 요청헤더)
						Map.class//응답 데이타가 {}일때				
						);
		
		Map responsebody = responseEntity.getBody();
		System.out.println(responsebody.get("order_id"));
		//결제정보 가져오기 성공//
		
		return null;
	}
	
	@RequestMapping("/orderInfo")
	@ResponseBody
	public String orderInfo(@RequestParam Map map) throws JsonProcessingException {
		/*
		System.out.println("map에 담겨있는 데이타"+map);
		
		String items=(String) map.get("checkedItems");
		String uNo=(String) map.get("uNo");
		String sum=(String) map.get("sum");
		System.out.println("items정보"+items);
		System.out.println("uNo정보"+uNo);
		System.out.println("sum정보"+sum);
		
		model.addAttribute("items",items);
		model.addAttribute("uNo",uNo);
		model.addAttribute("sum",sum);*/
		
		//ObjectMapper mapper = new ObjectMapper();
		//mapper.setVisibility(PropertyAccessor.FIELD,Visibility.ANY);
		//String mapperData = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);	
		
		return "payment/checkout.helltalk";
	}
	
	@RequestMapping("/order.do")
	public String order() {
		
		return "payment/checkout.helltalk";
	}
}
