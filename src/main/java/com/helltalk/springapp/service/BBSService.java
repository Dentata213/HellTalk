package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BBSService<T> {

	//전체 목록
	List<T> selectBBS(Map map);
	
	//게시글 저장,수정,삭제
	int insertBBS(Map map);
	int editBBS(Map map);
	int deleteBBS(Map map);
}
