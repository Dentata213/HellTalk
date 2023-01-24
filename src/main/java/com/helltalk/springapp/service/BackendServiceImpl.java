package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.BackendDAO;
import com.helltalk.springapp.models.BackendService;
import com.helltalk.springapp.models.PaymentDTO;

@Service
public class BackendServiceImpl implements BackendService{

	@Autowired
	private BackendDAO dao;
	
	@Override
	public List<MemberDTO> selectAllUser(Map map) {
		List<MemberDTO> lists = dao.selectAllUser(map);
		return lists;
	}

	@Override
	public List<BBSDto> selectAllWritings(Map map) {
		List<BBSDto> lists = dao.selectAllWritings(map);
		return lists;
	}

	@Override
	public List<PaymentDTO> selectAllReceipt(Map map) {
		List<PaymentDTO> lists = dao.selectAllReceipt(map);
		return lists;
	}

	@Override
	public int blockUser(Map map) {
		return dao.blockUser(map);
	}

	public int kickUser(Map map) {
		return dao.kickUser(map);
	}

	public int removeOne(Map map) {
		return dao.removeOne(map);
		
	}
	
}
