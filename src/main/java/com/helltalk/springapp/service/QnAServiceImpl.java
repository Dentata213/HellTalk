package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.QnADao;

@Service
public class QnAServiceImpl implements QnAService<QnADto> {

	@Autowired
	private QnADao dao;
	
	@Override
	public List<QnADto> selectQnA(Map map) {
		List<QnADto> list = dao.selectQnA(map);
		return list;
	}

	@Override
	public int insertQnA(Map map) {
		
		return dao.insertQnA(map);
	}

	@Override
	public int deleteQnA(Map map) {
		
		return dao.deleteQnA(map);
	}

	@Override
	public int editQnA(Map map) {
		
		return dao.editQnA(map);
	}

	public List<QnADto> selectQnAMe(Map map){
		return dao.selectQnAMe(map);
	}
	
}
