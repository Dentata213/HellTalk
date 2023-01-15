package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.models.DietDTO;
import com.helltalk.springapp.models.DietService;

@Service("dietService")
public class FoodServiceImpl implements DietService<DietDTO>{
	
	@Autowired
	private FoodDAO dao;

	@Override
	public List<DietDTO> selectList(Map map, HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DietDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) {
		int newfoodNo= dao.insert(map);
		System.out.println("음식 추가?: "+newfoodNo);
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
}
