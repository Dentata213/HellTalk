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

	public int inset(Map map) {
		//마이바티스의 insert는 무조건 영향받은 행의 수 반환
		template.insert("caldInset",map);		
		//Map에 저장된 행의 키(번호)를 꺼내와서 반환
		return Integer.parseInt(map.get("caldno").toString());
	}

}