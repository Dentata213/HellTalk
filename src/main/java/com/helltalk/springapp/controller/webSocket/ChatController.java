package com.helltalk.springapp.controller.webSocket;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.helltalk.springapp.models.ChatDto;
import com.helltalk.springapp.models.ChatService;


@Controller
public class ChatController {

	@Autowired
	public ChatService<ChatDto> chatService;
	
	//채팅방으로 들어가기 ok
	@RequestMapping("/chat.do")
	public String chat(@RequestParam Map map,
			Model model,HttpServletRequest req,
			Authentication auth) 
		{
		 model.addAttribute("roomno",map.get("roomno")); //쿼리스트링으로 넘어온 방번호(map)로 방번호구분(&웹소켓이랑 연결하기 위한 식별자번호로 사용)
		
		List<ChatDto> chatList =chatService.selectListMsg(map, req); //방번호로 이전의 채팅내용 가져와서 뿌려주자
		model.addAttribute("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());
		System.out.println("가져오나용"+chatList);
		model.addAttribute("chatList",chatList);
		System.out.println("세션도필요해.."+model);
		return "community/chat/chatroom.helltalk";
	}
	
	//채팅내용목록뿌리기(방번호만 넘겨서 값을가져와) ok
		@RequestMapping(value="/viewMsg.do",method ={RequestMethod.GET,RequestMethod.POST})
		@ResponseBody
		public String listMsg(
				@RequestBody Map map,
				HttpServletRequest req,
				Model model,
				Authentication auth
				) {	
			map.put("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());	
			System.out.println("여기에 no 없어?"+map);
			model.addAttribute("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());		
			
		//	List<ChatDto> chatList =chatService.selectListMsg(map, req);
		//	model.addAttribute("chatList",chatList);
		//	model.addAttribute("roomno",map.get("roomno"));
		//	System.out.println("메시지내용"+model);	
			return "community/chat/chatroom.helltalk";
		}
	
	//채팅방목록뿌리기ok
	@RequestMapping(value="/list.do",method ={RequestMethod.GET,RequestMethod.POST})
	public String list(
			@RequestParam Map map,
			HttpServletRequest req,
			Model model,
			Authentication auth ) {	
		map.put("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());	
		model.addAttribute("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());
		List<ChatDto> chatList =chatService.selectList(map, req);		
		model.addAttribute("chatList",chatList);
		System.out.println(model);
		return "community/chat/chatList";
	}
	
	/*
	 방 생성하기()
	 */
	@RequestMapping("/createRoom.do")
	@ResponseBody
	public Map createRoom(@RequestBody HashMap map){
	int newroom	= chatService.insert(map);
		map.put("no", newroom);
		System.out.println("방번호?:"+map);
		return map;	
	}
	
	//채팅방들어가기==> 이거 안 씀 삭제예정
	@RequestMapping("/enterroom.do")
	@ResponseBody
	public String view(@RequestParam Map map,Model model) {
		ChatDto roomno = chatService.selectOne(map);
		System.out.println("no가져와!!"+roomno);
		model.addAttribute("roomno",roomno);
		return "community/chat/chat ";
	}
	
	//채팅내용저장하기 insert
	@PostMapping("/sendMag.do")
	@ResponseBody
	public Map write(@RequestBody Map map) {
		//이건 나중에 필요하면 map에 넣어서 쓰기
		int mno=chatService.insert(map);
//		map.put("mno", mno);
		return map;
	}
		
	
}

