package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.ExerciseDAO;

@Service
public class ExerciseServiceImpl implements ExerciseService<ExerciseDTO>{

	@Autowired
	private ExerciseDAO dao;
	
	@Override
	public List<ExerciseDTO> selectExerciseKindList(Map map) {
		List<ExerciseDTO> listExerKind= dao.selectExerciseKindList(map);
		return listExerKind;
	}

	//운동 전체 목록 조회
	@Override
	public List<ExerciseDTO> selectExerciseList(Map map) {
		List<ExerciseDTO> listExer=dao.selectExerciseList(map);
		return listExer;
	}

	//운동부위별 운동 목록 조회
	@Override
	public List<ExerciseDTO> selectExerciseListByKind(Map map) {
		List<ExerciseDTO> listExer=dao.selectExerciseListByKind(map);
		return listExer;
	}

	@Override
	public ExerciseDTO selectOneExercise(Map map) {
		
		
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertExercise(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateExercise(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteExercise(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map> selectExerciseRoutine(Map map) {
		List<Map> recommendRoutList=dao.selectExerciseRoutine(map);
		return recommendRoutList;
	}

	@Override
	public int insertExerciseRoutine(Map map) {
		int newRoutNo =dao.insertExerciseRoutine(map);
		return newRoutNo;
	}

	@Override
	public int updateExerciseRoutine(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteExerciseRoutine(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ExerciseDTO selectOneChallenge(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertChallenge(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateChallenge(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteChallenge(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
