package com.helltalk.springapp.models;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ChatService<T> {
	
List<T> selectList(Map map,HttpServletRequest req);
	
	//상세보기용]
	T selectOne(Map map);
	//입력/수정/삭제용
	int insert(Map map);
	int delete(Map map);
	int update(Map map);

	List<ChatDto> selectListMsg(Map map, HttpServletRequest req);

}
