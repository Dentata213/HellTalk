package com.helltalk.springapp.controller.webSocket;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;


//websocket에서 http세션 정보를 가져올 때 필요하다고 함 !!
@Component  
public class ChatHandler extends TextWebSocketHandler {
	//우선 기본적인 구현은 1:1채팅으로 할 거
	private static List<String> onlineList = new ArrayList<>();	// clients list online
	private static List<WebSocketSession> sessionList = new ArrayList<>(); // clients's session list
	//접속한 클라이어언트
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
		String senderId =(String)session.getAttributes().get("HTTP.SESSION.ID");
				//.toString(); http세션에연결된 아이디를 가져옴 (web소켓 아이디 아님!!)
		System.out.println("진짜 http세선인지확인 "+senderId);
		System.out.println("toString으로 확인"+(String)session.getAttributes().toString());
		
		 //getPayload()로 메시지를 얻어옴
		String payload = message.getPayload();
		System.out.println("payload메시지:"+payload);
	
	for(WebSocketSession client:clients.values()) {  
		if(!session.getId().equals(client.getId())) {  //자기가 보낸 메시지를 자기한테 다시 받지 않도록
			//받은 메시지를 그대로 접속한 모든 인원에게 push
			client.sendMessage(message);
			System.out.println("client아이디?:"+client.getId());
		}
	}
		
		/*		// master status  conainsKey 가 뭘까...
		String masterStatus = null;
		if (clients.containsKey("master")) {
			masterStatus = "online";
		} else {
			masterStatus = "offline";
		}*/
		
		// json test
		Map<String, Object> dataMap = new HashMap<>();

		//sending time 
		LocalDateTime currentTime = LocalDateTime.now();
		String time = currentTime.format(DateTimeFormatter.ofPattern("hh:mm a, E"));
		
		// message parsing to json	 
		//	dataMap = jsonToMap(payload);
		dataMap.put("senderId", senderId);
		dataMap.put("time", time);
		System.out.println(dataMap);
		
		//메시지를 받는 사람...
		String receiverId = null;
		
		for(WebSocketSession client2:clients.values()) {  
			if(!session.getId().equals(client2.getId())) {
			   receiverId = client2.getId();	
			}
		}				

		System.out.println("datemap"+dataMap);
		System.out.println("receiverId"+receiverId);
	//	log.info("final dataMap >>> " + dataMap);

		//send a message
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
/////////추가한거	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable e) throws Exception {
		 System.out.println(session.getId()+"와 통신장애 발생:"+e.getMessage());
	}///////

	//클라이언트와 연결 끊어졌을 때 호출되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//컬렉션 저장 된 클라이언트 삭제
		clients.remove(session.getId());
		System.out.println(session.getId()+"연결이 끊어졌습니다.");		
	}/////////
	
}