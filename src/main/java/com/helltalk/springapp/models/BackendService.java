package com.helltalk.springapp.models;

import java.util.List;
import java.util.Map;

public interface BackendService {
//회원관리
	//모든 회원 조회
	List selectAllUser();
	
//게시글관리
	//모든 글 조회
	List selectAllWritings();
	
//결재관리
	//모든 결재 목록 조회
	List selectAllReceipt();
	
}

