package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.service.ExerciseDTO;

@Repository
public class ExerciseDAO {
	
	@Autowired
	private SqlSessionFactory sqlMapper;

	public List selectExerciseKindList(Map map) {
		SqlSession session= sqlMapper.openSession();		
		List<ExerciseDTO> listExerKind= session.selectList("selectExerciseKindList",map);
		session.close();
		return listExerKind;
	}

}
