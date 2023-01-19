package com.helltalk.springapp.controller.webSocket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ChatController {
	
	@RequestMapping("/chat1.do")
	public String list(
			HttpServletRequest req) {	
    	HttpSession session = req.getSession();
    	session.setAttribute("HTTP.SESSION.ID","kim");
    	System.out.println("세션확인"+session);
		return "community/chat/test.helltalk";
	}
	
	

	@GetMapping("/chat")	// client uri
	public void getChat(HttpServletRequest request, @RequestParam String id) {

		HttpSession session = request.getSession();

		if (id.equals("guest")) {
			// make random nickname using sessionid
			String name = "guest" + session.toString().substring(session.toString().indexOf("@"));
			session.setAttribute("sessionId", name);
		} else if(id.equals("master")) {
			String name = "master";
			session.setAttribute("sessionId", name);
		}
	}
	@GetMapping("/chat/master")	// master uri
	public String enterChatAsMaster(HttpServletRequest request) {
	//	log.info("@ChatController, getChat()");
		return "/chat";
	}
}
