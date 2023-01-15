package com.helltalk.springapp.models;

import java.util.List;
import java.util.Map;

public interface BackendService {
//회원관리
	//모든 회원 조회
	List selectAllUser(Map map);
	//회원 차단/차단해제
	int blockUser(Map map);
	
//게시글관리
	//모든 글 조회
	List selectAllWritings(Map map);
	
	
//결재관리
	//모든 결재 목록 조회
	List selectAllReceipt(Map map);
	
}

