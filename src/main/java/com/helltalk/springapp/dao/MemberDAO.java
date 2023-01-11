package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.service.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<MemberDTO> findAllUser(Map map) {		
		return template.selectList("findAllUser", map);
	}
	
	public MemberDTO findUserByNo(Map map) {		
		return template.selectOne("findUserByNo", map);
	}
	
	public int idChekc(Map map) {
		return template.selectOne("idCheck",map);
	}
	
	public int insert(Map map) {		
		return template.insert("userInsert",map);
	}
	
	public int delete(Map map) {		
		return template.delete("userDelete",map);
	}
	
	public int update(Map map) {
		return template.update("userUpdate",map);
	}
	
	
	
}
