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
	
	//운동루틴 조회 및 저장
	List<T> selectExerciseRoutine(Map map);
	int insertExerciseRoutine(Map map);
	int updateExerciseRoutine(Map map);
	int deleteExerciseRoutine(Map map);
	
	//챌린지 조회 및 저장
	T selectOneChallenge(Map map);
	int insertChallenge(Map map);
	int updateChallenge(Map map);
	int deleteChallenge(Map map);
	
	
	
}
