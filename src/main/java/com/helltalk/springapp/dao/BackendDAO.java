package com.helltalk.springapp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.models.PaymentDTO;
import com.helltalk.springapp.service.MemberDTO;

//@Repository
public class BackendDAO {

	//@Autowired
	private SqlSessionTemplate template;

	public List<MemberDTO> selectAllUser() {
		return template.selectList("selectAllUser");
	}

	public List<PaymentDTO> selectAllReceipt() {
		return template.selectList("selectAllReceipt");
	}
	
	

}
