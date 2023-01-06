package com.helltalk.springapp.controller.payment;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class PaymentController {
	
	@Value("${application_id}")
	private String application_id;
	@Value("${private_key}")
	private String private_key;
	@Autowired
	private RestTemplate restTemplate;
	
	@RequestMapping("/getToken.do")
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
		
		return null;
	}
}
