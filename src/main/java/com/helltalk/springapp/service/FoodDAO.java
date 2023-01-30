package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.models.FoodDTO;

@Repository
public class FoodDAO {
	// 마이바티스 오라클 주입
	@Autowired
	private SqlSessionFactory sqlMapper;
	@Autowired
	private SqlSessionTemplate template;
	
	public int insert(FoodDTO dto) {
		return template.insert("foodInsert",dto);
	}

	public int selectFoodAffected(FoodDTO dto) {
		return template.selectOne("foodSelectOneCount", dto);
	}

	public FoodDTO selectOne(FoodDTO dto) {
		return template.selectOne("foodSelectOne",dto);
	}
	
	//식사구분 한끼
	public FoodDTO foodSelectOneByCd(Map map) {
		return template.selectOne("foodSelectOneByCd",map);
	}
			
	//한끼 - 아침
	public List selectListEatBreakfast(Map map) {
		List<FoodDTO> records = template.selectList("selectListEatBreakfast",map);
		return records;
	}
	
	//한끼 - 점심
	public List<FoodDTO> selectListEatLunch(Map map) {
		List<FoodDTO> records = template.selectList("selectListEatLunch",map);
		return records;
	}

	public List<FoodDTO> selectListEatDinner(Map map) {
		List<FoodDTO> records = template.selectList("selectListEatDinner",map);
		return records;
	}		

}
