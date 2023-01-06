package com.helltalk.springapp.config;

import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

//※주로 외부 라이브러리를 자바코드를 통해서 빈으로 등록시
@Configuration
public class RestTemplateConfig {
	/*
	 * 반환 타입:IOC컨테이너(스프링 컨테이너)에 등록할 빈(싱글 톤)
	 * 메소드명:생성된 빈의 이름(아이디값)
	 * 예:RestTemplate restTemplate = new RestTemplate(ClientHttpRequestFactory)
	 */
	
	/*
	 사전 작업:POM.XML에 아래 등록(RestTemplate사용시 커넥션 풀을 사용하기 위함)
	 <dependency>
	    <groupId>org.apache.httpcomponents</groupId>
	    <artifactId>httpclient</artifactId>
	    <version>4.5.13</version>
	 </dependency>		  
	 */
	@Bean
	public RestTemplate restTemplate() {
		//1.커넥션 풀 사용을 위한 HttpClient객체 생성
		CloseableHttpClient httpClient = HttpClientBuilder.create()
				.setMaxConnTotal(50)//연결을 유지할 최대 Http커넥션 수
				.setMaxConnPerRoute(50)//Route당(요청 URI주소당) 최대 Http커넥션 수
				.setConnectionTimeToLive(5,TimeUnit.SECONDS)//커넥션 연결 유지시간
				.build();
		//2.타임아웃 설정을 위한 객체 생성
		HttpComponentsClientHttpRequestFactory factory=new HttpComponentsClientHttpRequestFactory();
		factory.setConnectionRequestTimeout(3000);//요청 타임아웃 시간
		factory.setHttpClient(httpClient);
		
		return new RestTemplate(factory);
	}
	
	
	
}
