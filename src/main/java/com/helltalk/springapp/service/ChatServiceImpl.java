package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.ChatDao;
import com.helltalk.springapp.models.CalService;
import com.helltalk.springapp.models.ChatDto;

@Service("chatService")
public class ChatServiceImpl implements CalService<ChatDto> {

	@Autowired
	private ChatDao dao;
	
	@Override
	public List<ChatDto> selectList(Map map, HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ChatDto selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) {
		
		return 0;
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

	@Override
	public String findUserByNo(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

}
