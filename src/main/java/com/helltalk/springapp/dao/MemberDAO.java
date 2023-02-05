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
	
	public int emailCheck(Map map) {
		return template.selectOne("emailCheck",map);
	}
	
	public int nicknameCheck(Map map) {
		return template.selectOne("nicknameCheck",map);
	}
	
	public int insert(Map map) {		
		return template.insert("userInsert",map);
	}
	
	public int insertSoical(Map map) {		
		return template.insert("insertSoicalUser",map);
	}
	
	public int delete(Map map) {		
		return template.delete("userDelete",map);
	}
	
	public int update(Map map) {
		return template.update("userUpdate",map);
	}

	public MemberDTO findUserByEmail(Map map) {
		return template.selectOne("findUserByEmail",map);
	}

	public MemberDTO findUserByEail(Map map) {
		return template.selectOne("findUserByEail", map);
	}

	
	
	
	
}
