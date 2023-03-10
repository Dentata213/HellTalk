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
		return dao.selectList(map);
	}
	
	@Override
	public DietDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int insert(Map map) {
		System.out.println("map.get(uemail):"+map.get("uemail"));
		return dao.insert(map);
	}
	
	//식단 No 있는지 확인
	public int selectCountByNo(Map map) {
		return dao.selectCountByNo(map);
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
	
	//한끼에서 음식 하나를 삭제
	public int SelectFoodDelete(Map map) {
		return dao.SelectFoodDelete(map);
	}

	public int selectDietNo(Map map) {
		return dao.selectDietNo(map);
	}
	
	

	
	
}
