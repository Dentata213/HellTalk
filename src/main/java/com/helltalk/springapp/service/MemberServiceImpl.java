package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.MemberDAO;
import com.helltalk.springapp.models.MemberService;

@Service
public class MemberServiceImpl implements MemberService<MemberDTO>{
	
	@Autowired
	MemberDAO dao;

	@Override
	public List<MemberDTO> selectUsers(Map map) {
		List<MemberDTO> users = dao.findAllUser(map);
		return users;
	}

	@Override
	public MemberDTO selectOne(Map map) {
		return dao.findUserByNo(map);
	}

	@Override
	public int insertUser(Map map) {
		return dao.insert(map);
	}

	@Override
	public int updateUser(Map map) {   //회원의 닉네임,키,몸무게 수정가능하게 함
		return dao.update(map);
	}

	@Override
	public int deleteUser(Map map) {
		// TODO Auto-generated method stub
		return dao.delete(map);
	}

	@Override
	public int emailCheck(Map map) {
		return dao.emailCheck(map);
	}
	
	
	
	

}
