package com.helltalk.springapp.models;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface PaymentService<T> {
	
	//장바구니 전체 목록 조회
	List<T> selectCartList(Map map);
	//전체 결재 목록 조회
	List<T> selectReceiptList(Map map);
	
	//장바구니 저장, 수정, 삭제
	int insertCart(Map map);
	int updateCart(Map map);
	int deleteCart(Map map);
	
	int calcCart(Map map);
	
	//단건 결재 조회 및 저장
	T selectOneReceipt(Map map);
	int insertReceipt(Map map);
	int updateReceipt(Map map);
	int deleteReceipt(Map map);
	
	//장바구니 존재여부 조회
	boolean isEmpty(Map map);
	

		
}
