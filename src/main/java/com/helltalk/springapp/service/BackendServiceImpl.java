package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.BackendDAO;
import com.helltalk.springapp.models.BackendService;
import com.helltalk.springapp.models.PaymentDTO;

//@Service
public class BackendServiceImpl implements BackendService{

	//@Autowired
	private BackendDAO dao;
	
	@Override
	public List<MemberDTO> selectAllUser(Map map) {
		List<MemberDTO> lists = dao.selectAllUser();
		return lists;
	}

	@Override
	public List selectAllWritings(Map map) {
		
		return null;
	}

	@Override
	public List<PaymentDTO> selectAllReceipt(Map map) {
		List<PaymentDTO> lists = dao.selectAllReceipt();
		return lists;
	}

	@Override
	public int blockUser(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
