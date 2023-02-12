package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.service.BBSDto;
import com.helltalk.springapp.service.QnADto;

@Repository
public class BBSDao{

	@Autowired
	private SqlSessionTemplate template;
	
	public List<BBSDto> selectBBS(Map map){
		List<BBSDto> list = template.selectList("selectBBS",map);
		return list;
	}
	//입력
	public int insertBBS(Map map) {
		
		return template.insert("insertBBS",map);
	}
	//수정
	public int editBBS(Map map) {
		
		return template.update("eidtBBS",map);
	}
	//삭제
	public int deleteBBS(Map map) {
		
		return template.delete("deleteBBS",map);
	}
	public void likeBBS(Map map) {
		// TODO Auto-generated method stub
		template.update("likeBBS",map);
		
	}
	
	
}/////////
