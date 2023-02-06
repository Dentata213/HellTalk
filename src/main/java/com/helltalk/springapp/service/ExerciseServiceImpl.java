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
	public List<Map> selectRoutine(Map map) {
		List<Map> recommendRoutList=dao.selectRoutine(map);
		return recommendRoutList;
	}

	@Override
	public int insertRoutine(Map map) {
		int rout_no =dao.insertRoutine(map);
		System.out.println("새로 추가된 루틴 번호:"+rout_no);
		return rout_no;
	}

	@Override
	public int updateRoutine(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRoutine(Map map) {
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

	//rout_no로 dayroutine select
	@Override
	public List selectDayRoutine(Map map) {
		List<ExerciseDTO> listDayRoutine=dao.selectDayRoutine(map);
		return listDayRoutine;
	}

	@Override
	public int insertDayRoutine(Map map) {
		int dr_no=dao.insertDayRoutine(map);
		return dr_no;
	}

	@Override
	public int updateDayRoutine(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDayRoutine(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List selectExerList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertExerList(Map map) {
		
		return dao.insertExerList(map);
	}

	@Override
	public int updateExerList(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteExerList(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
