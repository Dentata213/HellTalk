package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.service.BBSDto;

	@Repository
	public class BBSDao{

	@Autowired
	private SqlSessionTemplate template;
	
	public List<BBSDto> selectBBS(Map map){
		List<BBSDto> list = template.selectList("selectBBS",map);
		return list;
	}
	
}
