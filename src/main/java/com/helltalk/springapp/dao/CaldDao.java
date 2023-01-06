package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CaldDao {
	
	
	//마이바티스 오라클 주입
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List findAll(Map map) {
		return template.selectList("findAll",map);		
	}

}
