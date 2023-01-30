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
	
	public Map findRout(Map map) {
		System.out.println("dao에서map"+map);
		return template.selectOne("findRout",map);
	}

	public List<CalcDto> findStart(Map map) {	
		return template.selectList("findStart",map);
	}
	
}
