package com.helltalk.springapp.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FoodDAO {
	// 마이바티스 오라클 주입
	@Autowired
	private SqlSessionFactory sqlMapper;
	@Autowired
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
			
			

}
