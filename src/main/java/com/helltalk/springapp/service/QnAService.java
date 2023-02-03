package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface QnAService<T> {
		//목록용
		List<T> selectQnA(Map map);
		
		//입력/수정/삭제용
		int deleteQnA(Map map);
		int editQnA(Map map);
		int insertQnA(Map map);

}
