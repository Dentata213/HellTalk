package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {

	@Autowired
	private SqlSessionTemplate template;

	public List selectCartList(Map map) {
		return template.selectList("selectCartList",map);
	}

	public List selectReceiptList(Map map) {
		return template.selectList("selectReceiptList",map);
	}
	
	
}
