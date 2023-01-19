package com.helltalk.springapp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.helltalk.springapp.controller.webSocket.ChatHandler;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
		
	
	private final ChatHandler chatHandler ;
	public  WebSocketConfig(ChatHandler chatHandler) {
		this.chatHandler = chatHandler;	
	}
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chatHandler, "/chating"+"2"+".do")
		.setAllowedOrigins("*")
		.addInterceptors(new HttpSessionHandshakeInterceptor());
		System.out.println("여긴 config");
				// interceptor for adding httpsession into websocket session
	}

	
	
}
