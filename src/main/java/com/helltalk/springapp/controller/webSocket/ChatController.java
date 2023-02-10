package com.helltalk.springapp.controller.webSocket;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
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

import com.helltalk.springapp.dao.ChatDao;
import com.helltalk.springapp.models.ChatDto;
import com.helltalk.springapp.models.ChatService;


@Controller
public class ChatController {

	@Autowired
	public ChatService<ChatDto> chatService;
	
	@Autowired
	public ChatDao dao;
	
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
		
		
		dao.findAllchat(map);
		model.addAttribute("chatList",chatList);
		System.out.println("채팅방..."+model);
		return "community/chat/chatList.helltalk";
	}
	
	//친구찾기(검색기능-채팅방생성과 연결)
	@RequestMapping("/findfriend.do")
	public String findfreind(
			@Parameter Map map,
			HttpServletRequest req,
			Authentication auth,
			Model model ) {
		map.put("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());	
		
		List<ChatDto> friends =chatService.findfriend(map);
		
		model.addAttribute("friends",friends);
		System.out.println("친구찾기뿌려주기"+model);
		return "community/chat/findFriend.helltalk";
	}
	
	
	
	// 방 생성하기(친구검색-> room_name은 친구id로? 친구 id,내id 넘기기)
	@RequestMapping(value="/createRoom.do", method= {RequestMethod.GET, RequestMethod.POST})
//	@ResponseBody
	public String createRoom(
			@RequestParam Map map,
			Authentication auth){
		map.put("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());
		System.out.println("받아온맵"+map);
		
		chatService.insertNewRoom(map);
		return "community/chat/chatList" ;	
	}
	
	//생성된방인지 확인여부
	@RequestMapping("/enterroom.do")
	@ResponseBody
	public String view(
			@RequestBody Map map,
			Model model,
			Authentication auth) {
		map.put("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());	
		
		String isexist = null;
		ChatDto dto =chatService.selectOne(map);
		
		if(dto==null){
			isexist="null";
		}
		
		else {
			
			isexist= "True" ;
		}
		return isexist ;
	}
	
	//채팅내용저장하기 insert
	@RequestMapping("/sendMag.do")
	@ResponseBody
	public Map write(
			@RequestBody Map map,
			Authentication auth) {
		
		map.put("uemail",((UserDetails)auth.getPrincipal()).getUsername().toString());	
		System.out.println("채팅내용저장하기"+map);
		int msg=chatService.insert(map);
		
		return map;
	}
		
	
}

