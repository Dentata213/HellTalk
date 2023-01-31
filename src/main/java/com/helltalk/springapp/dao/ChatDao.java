package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List findAllchat(Map map) {		
		return template.selectList("findAllchat",map);
	}
	
	public int insert(Map map) {
		template.insert("chatRoomInset",map);	
		return Integer.parseInt(map.get("no").toString()); //방 번호로 selectone 함
		
	}

}