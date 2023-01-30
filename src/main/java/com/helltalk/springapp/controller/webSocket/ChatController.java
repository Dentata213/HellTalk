package com.helltalk.springapp.controller.webSocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.helltalk.springapp.models.CalService;
import com.helltalk.springapp.models.ChatDto;


@Controller
public class ChatController {

	@Autowired
	public ChatDto roomDto;
	
	@Autowired
	public CalService<ChatDto> chatService;
	
	@RequestMapping("/chat.do")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		System.out.println("여기 지나감?");
		mv.setViewName("community/chat/chat");
		return mv;
	}
	
	 //방 페이지
	//채팅방목록으로 가기 
	@RequestMapping("/room.do")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("community/chat/room");
		//뷰의 이름, 뷰로 보낼 데이터는 mv.addObject("키","값") 으로 보냄
		return mv;
	}
	
	/*
	 방 생성하기
	 */
	@RequestMapping("/createRoom.do")
	@ResponseBody
	public Map createRoom(@RequestBody HashMap map){
	int newroom	= chatService.insert(map);
		map.put("no", newroom);
		System.out.println("방번호?:"+map);
		return map;	
	}
//////////////////////////////////	
	/*
	 * 방 정보가져오기(위에 no로 가져올거임!!)
	
	@RequestMapping("/getRoom")
	public @ResponseBody List<ChatDto> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	} */
	
	/*
	 * 채팅방
	
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int roomNo = Integer.parseInt((String) params.get("roomNo"));		
		List<ChatDto> new_list = roomList.stream().filter(o->o.getRoomNo()==roomNo).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) { //채팅방으로 이동
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNo", params.get("roomNo"));
			mv.setViewName("chat");
		}
		else {  //채팅방 목록으로 이동
			mv.setViewName("room");
		}
		return mv;
	}
	 */
	/*@RequestMapping("/chat1.do")
	public String list(
			HttpServletRequest req) {	
    	HttpSession session = req.getSession();
    	session.setAttribute("HTTP.SESSION.ID","kim");
    	System.out.println("세션확인"+session);
		return "community/chat/test.helltalk";
	}
		
	*/
}

