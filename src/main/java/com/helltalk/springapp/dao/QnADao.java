package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.service.QnADto;

@Repository
public class QnADao{

	@Autowired
	private SqlSessionTemplate template;
	
	public List<QnADto> selectQnA(Map map){
		List<QnADto> list = template.selectList("selectQnA",map);
		return list;
	}
	//입력
	public int insertQnA(Map map) {
		
		return template.insert("insertQnA",map);
	}
	//수정
	public int editQnA(Map map) {
		
		return template.update("editQnA",map);
	}
	//삭제
	public int deleteQnA(Map map) {
		
		return template.delete("deleteQnA",map);
	}
	
	
}/////////
