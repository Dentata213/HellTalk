package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

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

	public int insertRoutine(Map map) {
		//SqlSession session= sqlMapper.openSession();
		Set keys= map.keySet();
		for(Object key:keys) {
			Object value=map.get(key);
			System.out.println(String.format("%s : %s",key,value));
		}
		template.insert("insertRoutine",map);
		
		//int routNo=(int) map.get("rout_no");
		//System.out.println("newRoutNo"+newRoutNo);
		//System.out.println("routNo"+routNo);
		//session.close();
		return Integer.parseInt(map.get("rout_no").toString());
	}

	public List<Map> selectRoutine(Map map) {
		List<Map> recommendRoutList= template.selectList("selectRoutine",map);
		return recommendRoutList;
	}
	
	//데이루틴 insert
	public int insertDayRoutine(Map map) {
		template.insert("insertDayRoutine",map);
		return Integer.parseInt(map.get("dr_no").toString());
	}

	//운동리스트 insert
	public int insertExerList(Map map) {
		System.out.println("운동리스트 sql 들어가기 전!!!");
		return template.insert("insertExerList",map);
	}

}
