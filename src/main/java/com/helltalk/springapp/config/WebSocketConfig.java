package com.helltalk.springapp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
/*
@Configuration
@EnableWebSocket  //servlet-context.xml에 빈으로 설정하는 것과 같다
public class WebSocketConfig implements WebSocketConfigurer{
	//웹소켓 서버를 생성자 인젝션으로 초기화-아래 ? 메소드에서 사용해야함
	private final WebSocketServer webSocketServer;
	public WebSocketConfig(WebSocketServer webSocketServer) {
		this.webSocketServer=webSocketServer;
	}
	//클리언이언트 접속을 위한 엔드 포인트 설정
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(webSocketServer, "/chat-ws.do").setAllowedOrigins("*");		
	}
	
}
*/