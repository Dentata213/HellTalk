package com.helltalk.springapp.models;

import java.util.List;
import java.util.Map;
import com.helltalk.springapp.service.MemberDTO;

public interface MemberService<T> {
	
	//회원 전체목록 조회
	List<T> selectUsers(Map map);
	
	//회원 상세보기
	T selectOne(Map map);
	T selectOneByEmail(Map map);
	int emailCheck(Map map);
	int nicknameCheck(Map map);
	
	//회원 저장,수정,삭제
	int insertUser(Map map);
	int updateUser(Map map);
	int deleteUser(Map map);
	
	//회원가입(소셜 로그인 전용)
	int insertSoicalUser(Map map);
	MemberDTO soicalOne(String username);
	
	
}
