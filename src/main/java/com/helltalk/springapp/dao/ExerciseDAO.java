package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.service.ExerciseDTO;

@Repository
public class ExerciseDAO {
	
	/*
	 * @Autowired private SqlSessionFactory sqlMapper;
	 */
	
	@Autowired
	private SqlSessionTemplate template;

	public List selectExerciseKindList(Map map) {
		//SqlSession session= sqlMapper.openSession();		
		List<ExerciseDTO> listExerKind= template.selectList("selectExerciseKindList",map);
		//session.close();
		return listExerKind;
	}

	public List<ExerciseDTO> selectExerciseList(Map map) {
		//SqlSession session= sqlMapper.openSession();		
		List<ExerciseDTO> listExer= template.selectList("selectExerciseList",map);
		//session.close();
		return listExer;
	}

	public List<ExerciseDTO> selectExerciseListByKind(Map map) {
		//SqlSession session= sqlMapper.openSession();		
		List<ExerciseDTO> listExer= template.selectList("selectExerciseListByKind",map);
		//session.close();
		return listExer;
	}

	public int insertExerciseRoutine(Map map) {
		//SqlSession session= sqlMapper.openSession();		
		int newRoutNo=template.insert("insertExerciseRoutine",map);
		int routNo=(int)map.get("rout_no");
		System.out.println("newRoutNo"+newRoutNo);
		System.out.println("routNo"+routNo);
		//session.close();
		return routNo;
	}

}
