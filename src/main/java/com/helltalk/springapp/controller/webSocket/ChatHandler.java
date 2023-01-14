package com.helltalk.springapp.controller.webSocket;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;


//websocket에서 http세션 정보를 가져올 때 필요하다고 함 !!
@Component  
public class ChatHandler extends TextWebSocketHandler {

	private static List<String> onlineList = new ArrayList<>();	// clients list online
	private static List<WebSocketSession> sessionList = new ArrayList<>(); // clients's session list
	//접속한 클라이어언트를 저장할 필요가 있나...?
	Map<String, WebSocketSession> clients = new HashMap<>();

	ObjectMapper json = new ObjectMapper();
	
	
	//클라이언트와 연결 되었을 때 호출되는 콜백 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//컬렉션에 연결된 클라이언트 추가
		clients.put(session.getId(),session);
		System.out.println(session.getId()+"연결 되었습니다.");
	}/////////
	
	// message
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {	
		// message data
		String senderId = (String)session.getAttributes().toString();
				//.get("sessionId");
		System.out.println(senderId+"연결!!");
		String payload = message.getPayload();
		
		// json test
		Map<String, Object> dataMap = new HashMap<>();
		
		// master status
		String masterStatus = null;
		if (clients.containsKey("master")) {
			masterStatus = "online";
		} else {
			masterStatus = "offline";
		}
		
		// sending time
		LocalDateTime currentTime = LocalDateTime.now();
		String time = currentTime.format(DateTimeFormatter.ofPattern("hh:mm a, E"));

	
		
		// message parsing to json
	//	dataMap =jsonToMap(payload);
		dataMap.put("senderId", senderId);
		dataMap.put("time", time);
		dataMap.put("masterStatus", masterStatus);
		dataMap.put("onlineList", onlineList);
		
		String receiverId = (String) dataMap.get("receiverId");

	//	log.info("final dataMap >>> " + dataMap);

		// send a message
		String msg = json.writeValueAsString(dataMap);
		if (clients.get(receiverId) != null) { // send a message to receiver
			clients.get(receiverId).sendMessage(new TextMessage(msg));
		}

		// send a message myself
		if(!senderId.equals(receiverId)) {	// send a message to myself
			dataMap.put("receiverId", senderId);
			msg = json.writeValueAsString(dataMap);
			session.sendMessage(new TextMessage(msg));
		}
	}
	
	

	
	
	
}