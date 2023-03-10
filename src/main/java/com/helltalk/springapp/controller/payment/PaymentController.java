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
	
	@Value("${application_id}")//properties ????????? application_id ????????????
	private String application_id;
	@Value("${private_key}")//properties ????????? private_key ????????????
	private String private_key;

	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private PaymentServiceImpl service;
	
	//???????????? ??????
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
		
		String imp_uid = (String)map.get("imp_uid");		
		PaymentController payment = new PaymentController();		
		api = new IamportClient(imp_key,imp_secret);		
		String token=service.getToken();
		
		return api.paymentByImpUid(imp_uid);
	}
	
	
	
	
	@RequestMapping("/mycart")
	public String mycart(@RequestParam Map map, Model model) {
		
		List<PaymentDTO> lists = service.selectCartList(map);
		int sum = service.calcCart(map);
		
		model.addAttribute("lists", lists);
		model.addAttribute("totalprice",sum);
		
		/*???????????? 4000?????? ?????????*/
		String text="BASE64??? ????????? ?????????";
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
		/*???????????? 4000?????? ?????????*/
		
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
	
	
	@RequestMapping("/getToken.do")//??????????????????
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
						uri,//?????? URI
						HttpMethod.POST,//?????? ?????????
						entity,//HttpEntity(??????????????? ????????????)
						Map.class//?????? ???????????? {}??????				
						);
		
		Map responsebody = responseEntity.getBody();
		System.out.println(responsebody.get("access_token"));
		//???????????? ???//
		return null;
	}
	
	@RequestMapping("/getOnePayment.do")//??????????????? ????????? ???????????? ????????????
	public String getOnePayment() {
		String access_token="";//?????? ??????
		String receiptID="";//?????????ID ??????, ????????? ID ???????????????
		//?????? ??????? ?????? ????????? ????????? ?????????????????? ???????????? ?????????
		
		
		//?????? Hedder
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer "+access_token);
		headers.add("Accept", "application/json");
		//?????? Body
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
						uri,//?????? URI
						HttpMethod.GET,//?????? ?????????
						entity,//HttpEntity(??????????????? ????????????)
						Map.class//?????? ???????????? {}??????				
						);
		
		Map responsebody = responseEntity.getBody();
		System.out.println(responsebody.get("order_id"));
		//???????????? ???????????? ??????//
		
		return null;
	}
	
	@RequestMapping("/orderInfo")
	@ResponseBody
	public String orderInfo(@RequestParam Map map) throws JsonProcessingException {
		/*
		System.out.println("map??? ???????????? ?????????"+map);
		
		String items=(String) map.get("checkedItems");
		String uNo=(String) map.get("uNo");
		String sum=(String) map.get("sum");
		System.out.println("items??????"+items);
		System.out.println("uNo??????"+uNo);
		System.out.println("sum??????"+sum);
		
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
