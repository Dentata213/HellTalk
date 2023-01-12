package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.BBSDao;

@Service
public class BBSServiceImpl implements BBSService<BBSDto>{
	
	@Autowired
	private BBSDao dao;
	
	// 게시물 목록 조회
	@Override
	public List<BBSDto> selectBBS(Map map) {
		List<BBSDto> list = dao.selectBBS(map);
		return list;
	}
	
	
	
}
	
