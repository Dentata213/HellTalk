package com.helltalk.springapp.models;

import java.util.List;
import java.util.Map;

public interface BackendService<T> {
//회원관리
	//모든 회원 조회
	List<T> selectAllUser(Map map);
	
	
//게시글관리
	//모든 글 조회
	List<T> selectAllWrite(Map map);
	
	
	
//결재관리 Payment에서 처리?
	//모든 결재 목록 조회
	
	
}

