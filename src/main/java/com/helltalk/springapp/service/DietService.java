package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

//제너릭 인터페이스
public interface DietService<T> {
	//로그인용]
	//boolean isLogin(Map map);
	
	//목록용]
	List<T> selectList(Map map, HttpServletRequest req);

	//상세보기용]
	T selectOne(Map map);

	//입력/수정/삭제용]
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
}