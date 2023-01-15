package com.helltalk.springapp.models;

import java.util.List;
import java.util.Map;

public interface MemberService<T> {
	
	//회원 전체목록 조회
	List<T> selectUsers(Map map);
	
	//회원 상세보기
	T selectOne(Map map);
	int emailCheck(Map map);
	
	//회원 저장,수정,삭제
	int insertUser(Map map);
	int updateUser(Map map);
	int deleteUser(Map map);

	
	
	
}
