package com.helltalk.springapp.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.CalcDao;
import com.helltalk.springapp.models.CalService;
import com.helltalk.springapp.models.CalcDto;

@Service("calcService")
public class CalcServiceImpl implements CalService<CalcDto> {

	@Autowired
	private CalcDao dao;

	@Override
	public List<CalcDto> selectList(Map map, HttpServletRequest req) {	
		List<CalcDto> lists = dao.findAllc(map);  	
		return dao.findAllc(map);
	}

	@Override
	public int insert(Map map) {
		return 0;
	}
	
	@Override
	public CalcDto selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Map selectOneR(Map map) {
		Map list = dao.findRout(map);
		if(list == null) {
			System.out.println("앞뒤로 날짜 계산해서 가공해서 내보내야겠지...");
		
		
		}
		
		return list;
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
