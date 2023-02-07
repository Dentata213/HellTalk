package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.models.ChatDto;

@Repository
public class ChatDao {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List findAllchat(Map map) {		
		return template.selectList("findAllchat",map);
	}
	
	public int insert(Map map) {
		template.insert("chatRoomInset",map);	
		return Integer.parseInt(map.get("no").toString()); //방 번호로 selectone 함
		
	}
	//이거 안쓰고있음
	public ChatDto selectOne(Map map) {
		return template.selectOne("findchatRoomno",map);
	}

	public int insertMsg(Map map) {
		return template.insert("sendMessage", map);	//혹시 마지막 메시지보낸 사람 정보필요하면 수정해야함
	}
	
	public List findAllMsg(Map map) {
		return template.selectList("findAllMsg",map);
	}
	
}