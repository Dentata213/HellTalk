package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

//제너릭 인터페이스
public interface ExerciseService<T> {

	//운동부위 전체 목록 조회
	List<T> selectExerciseKindList(Map map);
	//운동 전체 목록 조회
	List<T> selectExerciseList(Map map);
	//운동부위별 운동 목록 조회
	List<T> selectExerciseListByKind(Map map);
	
		
	//운동 조회 및 저장
	T selectOneExercise(Map map);
	int insertExercise(Map map);
	int updateExercise(Map map);
	int deleteExercise(Map map);
	
	//루틴 조회 및 저장
	List selectRoutine(Map map);
	int insertRoutine(Map map);
	int updateRoutine(Map map);
	int deleteRoutine(Map map);
	
	//데이루틴 조회 및 저장
	List selectDayRoutine(Map map);
	int insertDayRoutine(Map map);
	int updateDayRoutine(Map map);
	int deleteDayRoutine(Map map);
	
	//운동리스트 조회 및 저장
	List selectExerList(Map map);
	int insertExerList(Map map);
	int updateExerList(Map map);
	int deleteExerList(Map map);
	
	//챌린지 조회 및 저장
	T selectOneChallenge(Map map);
	int insertChallenge(Map map);
	int updateChallenge(Map map);
	int deleteChallenge(Map map);
	
	
	
}
