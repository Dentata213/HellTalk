package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.models.PaymentDTO;
import com.helltalk.springapp.service.BBSDto;
import com.helltalk.springapp.service.MemberDTO;
import com.helltalk.springapp.service.QnADto;

@Repository
public class BackendDAO {

	@Autowired
	private SqlSessionTemplate template;

	public List<MemberDTO> selectAllUser(Map map) {
		List<MemberDTO> list = template.selectList("selectAllUser",map);
		return list;
	}

	public List<PaymentDTO> selectAllReceipt(Map map) {
		List<PaymentDTO> list = template.selectList("selectAllReceipt",map);
		return list;
	}

	public List<BBSDto> selectAllWritings(Map map) {
		List<BBSDto> list = template.selectList("selectAllWritings",map);
		return list;
	}

	public int blockUser(Map map) {
		return template.update("blockUser", map);
	}

	public int kickUser(Map map) {
		return template.delete("kickUser", map);
	}

	public int removeOne(Map map) {
		return template.delete("removeOne",map);
	}

	public int getTotalRecordCount(Map map) {
		return template.selectOne("recodeCount",map);
	}

	public List findAll(Map map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public MemberDTO isUser(Map map) {
		return template.selectOne("isUser", map);
	}

	public List findAllQnA(Map map) {
		List<QnADto> list = template.selectList("selectAllQnA",map);
		return list;
	}

	public void updateQnAanswer(Map map) {
		template.update("updateAnswer",map);
	}

	public QnADto selectOneQnA(Map map) {
		return template.selectOne("selectOneQnA",map);
	}

	public void deleteQnA(int number) {
		template.delete("deleteOneQnA",number);
	}

	public List selectJoinMember() {
		return template.selectList("selectJoinMember");
	}

	public int selectGenderMember(String kind) {
		return template.selectOne("selectGenderMember",kind);
	}
	

}
