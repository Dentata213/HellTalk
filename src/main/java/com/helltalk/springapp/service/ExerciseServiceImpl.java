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

	@Override
	public List<ExerciseDTO> selectExerciseList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ExerciseDTO> selectExerciseListByKind(Map map) {
		// TODO Auto-generated method stub
		return null;
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
	public ExerciseDTO selectExerciseRoutine(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertExerciseRoutine(Map map) {
		// TODO Auto-generated method stub
		return 0;
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
