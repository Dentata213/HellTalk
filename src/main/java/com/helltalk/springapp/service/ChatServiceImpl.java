package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.ChatDao;
import com.helltalk.springapp.models.ChatDto;
import com.helltalk.springapp.models.ChatService;

@Service("chatService")
public class ChatServiceImpl implements ChatService<ChatDto> {

	@Autowired
	private ChatDao dao;
	
	@Override
	public List<ChatDto> selectList(Map map, HttpServletRequest req) {
		List<ChatDto> list = dao.findAllchat(map);	
		return list;
	}
	
	@Override
	public List<ChatDto> selectListMsg(Map map, HttpServletRequest req) {
		List<ChatDto> allMsg =dao.findAllMsg(map);	
		return allMsg;
	}

	@Override
	public ChatDto selectOne(Map map) {
		ChatDto oneno =dao.selectOne(map);
		System.out.println("dao에서는?"+oneno);
		return oneno;
	}

	@Override
	public int insert(Map map) {
		int mno=dao.insertMsg(map);
		System.out.println("메시지번호가 필요할 까?"+mno);
		return mno;
	}

	
	
	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	

}
