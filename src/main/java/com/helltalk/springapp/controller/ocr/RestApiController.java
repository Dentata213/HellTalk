package com.helltalk.springapp.controller.ocr;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.client.DefaultResponseErrorHandler;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


//@RestControllerAdvice
@RestController
public class RestApiController {

	@Autowired
	private RestTemplate restTemplate;
	@PostMapping("/google/vision/ocr")
	public Map ocr(@RequestParam String base64) throws JsonParseException, JsonMappingException, IOException {
		
		System.out.println(base64);
		
		restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
		restTemplate.setErrorHandler(new DefaultResponseErrorHandler() {
		        public boolean hasError(ClientHttpResponse response) throws IOException {
		            HttpStatus statusCode = response.getStatusCode();
		            return statusCode.series() == HttpStatus.Series.SERVER_ERROR;
		        }
		});
		
		//헤더
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer ya29.a0AX9GBdWK5_3AydZvyUzB2ELhcqCtuqgFulUTefHqoxoZ3Q0rhmDbDc5JuPVWCa8rxb4PaRNi5ZYFSBJZduhmyWj5eV11-jYTXRC_ZDUWsF7_FGss_hEGIEWg35DxqeFMMLPeEs5-Oil4uY7DK7tJnbZBKmLm-z_J3UVByR0aCgYKAXcSAQASFQHUCsbC3HwwF7-0fTqVBYaPxxjgwA0174");
		headers.add("x-goog-user-project", "expanded-port-373601");
		headers.add("Content-Type", "application/json; charset=utf-8");
		
		//바디
		ObjectMapper mapper = new ObjectMapper();
				
				String json =String.format("{"
						+ "  \"requests\": ["
						+ "    {"
						+ "      \"image\": {"
						+ "        \"content\": \"%s\""
						+ "      },"
						+ "      \"features\": ["
						+ "        {"
						+ "          \"type\": \"TEXT_DETECTION\""
						+ "        }"
						+ "      ]"
						+ "    }"
						+ "  ]"
						+ "}", base64);
				
				Map requestBody=mapper.readValue(json, Map.class);
				HttpEntity entity = new HttpEntity(requestBody, headers);	
				
				String uri="https://vision.googleapis.com/v1/images:annotate";
				
				
				
				ResponseEntity<Map> responseEntity =
						restTemplate.exchange(
								uri,//요청 URI
								HttpMethod.POST,//요청 메소드
								entity,//HttpEntity(요청바디와 요청헤더)
								Map.class//응답 데이타가 {}일때
												
								);
				
				return responseEntity.getBody();
			}
}
