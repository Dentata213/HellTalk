package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.models.PaymentDTO;

@Repository
public class PaymentDAO {

	@Autowired
	private SqlSessionTemplate template;

	public List<PaymentDTO> selectCartList(Map map) {
		map.put("U_NO", 1);
		map.put("PRO_NO", 1);
		
		List<PaymentDTO> list = template.selectList("selectCartList",map);
		return list;
	}

	public List selectReceiptList(Map map) {
		return template.selectList("selectReceiptList",map);
	}

	public int insertCart(Map map) {
		return template.insert("insertCart", map);
	}
	
	
	
}
