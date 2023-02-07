package com.helltalk.springapp.controller.webSocket;

import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


//websocket에서 http세션 정보를 가져올 때 필요하다고 함 !!
@Component  
public class ChatHandler extends TextWebSocketHandler {
	Map<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션(채팅참가자)을 담아둘 맵
	
	//1.연결되면 호출됨 (연결할 때 한 번만 실행)
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓 연결, 연결된 클라이언트 추가
		sessionMap.put(session.getId(), session);
		System.out.println("세션"+session);   //id,uri 들어있음
		System.out.println("채팅참가자 몇 명?"+sessionMap.size());
		System.out.println(session.getId()+"연결됨,여긴핸들러");
	}
	
	//클라이언트로 메시지 보내기 (메시지 보낼 때 마다 호출 됨)
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//메시지 발송
		System.out.println("핸드셰이크 잘되나 확인용:"+session.getHandshakeHeaders());  // 여기서 사용할 수 있는건 host=[192.168.0.29:8080] 요거..? 도필요 없을 것 같음
		System.out.println(session);
		String msg = message.getPayload();
		System.out.println("세션에 저장된 아이디"+session.getId());  
		
		for(WebSocketSession client:sessionMap.values()) {  
			if(!session.getId().equals(client.getId())) {  //자기가 보낸 메시지를 자기한테 다시 받지 않도록
				//받은 메시지를 그대로 접속한 모든 인원에게 push
				client.sendMessage(message);
				System.out.println(client);
			}
		}		
	}

	//채팅방 종료시 한 번 생성 됨
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//소켓 종료
		sessionMap.remove(session.getId());
	//	sessionMap.remove(session.getUri());
		super.afterConnectionClosed(session, status);
		System.out.println("연결이 끊어졌습니다.");
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable e) throws Exception {
		 System.out.println(session.getId()+"와 통신장애 발생:"+e.getMessage());
	}///////
	
}