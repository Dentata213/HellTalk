package com.helltalk.springapp.service;

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

	public FoodDTO foodSelectOneByCd(Map map) {
		return template.selectOne("foodSelectOneByCd",map);
	}
			
			

}
