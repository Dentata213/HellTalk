package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.DietDAO;
import com.helltalk.springapp.models.DietDTO;
import com.helltalk.springapp.models.DietService;

@Service("dietService")
public class DietServiceImpl implements DietService<DietDTO>{
	
	@Autowired
	private DietDAO dao;
	
	/*  DIET  */
	@Override
	public List<DietDTO> selectList(Map map, HttpServletRequest req) {
		List lists= dao.selectList(map);
		return null;
	}
	
	@Override
	public DietDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int insert(Map map) {
		return dao.insert(map);
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
	
	
	/*  EAT  */
	public int insertEat(Map map) {
		return dao.insertEat(map);
	}
	
	//음식 하나를 eatList에 저장
	public int insertEatList(Map map) {
		return dao.insertEatList(map);
	}

	//diet_no 가져오기
	public int selectOneNo(Map map) {
		return dao.selectOneNo(map);
	}
	
	

	
	
}
