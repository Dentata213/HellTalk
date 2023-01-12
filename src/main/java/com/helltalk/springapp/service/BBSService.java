package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BBSService<T> {

	//전체 목록
	List<T> selectBBS(Map map);
}
