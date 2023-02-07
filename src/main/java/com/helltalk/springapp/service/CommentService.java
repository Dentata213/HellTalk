package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface CommentService<T> {

	//전체 목록
	List<T> selectComment(Map map);
	
	//댓글 저장,수정,삭제
	int insertComment(Map map);
	int editComment(Map map);
	int deleteComment(Map map);
}
