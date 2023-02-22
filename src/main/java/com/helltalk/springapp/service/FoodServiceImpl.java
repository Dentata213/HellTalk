package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.models.DietService;
import com.helltalk.springapp.models.FoodDTO;

@Service("foodService")
public class FoodServiceImpl implements DietService<FoodDTO>{
	
	@Autowired
	private FoodDAO dao;

	@Override
	public List<FoodDTO> selectList(Map map, HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public FoodDTO selectOne(FoodDTO dto) {
		
		return dao.selectOne(dto);
	}
	
	
	public int selectFoodAffected(FoodDTO dto) {
		return dao.selectFoodAffected(dto);
	}
	
	/*있는 음식 찾기
	public String selectOne(FoodDTO dto) {
		String food= dao.selectOne(dto);
		System.out.println("이미 있는 음식:"+food);
		return dao.selectOne(dto);
	}*/
	
	
	public FoodDTO foodSelectOneByCd(Map map) {
		return dao.foodSelectOneByCd(map);
	}

	
	public int insert(FoodDTO dto) {
		return dao.insert(dto);
	}
	
	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public FoodDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//한끼
	public List<FoodDTO> selectListEatBreakfast(Map map) {
		return dao.selectListEatBreakfast(map);
	}


	public List<FoodDTO> selectListEatLunch(Map map) {
		return dao.selectListEatLunch(map);
	}


	public List<FoodDTO> selectListEatDinner(Map map) {
		return dao.selectListEatDinner(map);
	}	


	
	

}
