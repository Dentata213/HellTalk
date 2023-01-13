package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.models.CalcDto;

@Repository
public class CalcDao {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;

	public List<CalcDto> findAllc(Map map) {
		return template.selectList("findAllc",map);
	}
/*
	public int insert(Map map) {
		template.insert("calcInsert",map);
		return Integer.parseInt(map.get("calcno").toString());
	}
*/
}
