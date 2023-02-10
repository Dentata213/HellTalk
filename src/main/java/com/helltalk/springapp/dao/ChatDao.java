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
		System.out.println("어떻게다가지고오나"+template);
		return template.selectList("findAllchat",map);
	}
	
	public int insertNewRoom(Map map) {
		
		return template.insert("chatRoomInset",map); //방 번호로 selectone 함
		
	}
	
	public ChatDto selectemail(Map map) {
		return template.selectOne("findemailbyno",map);
	}
	
	
	public ChatDto selectOne(Map map) {
		ChatDto dto=template.selectOne("isnewchat",map);
		System.out.println("dto"+dto);
		return template.selectOne("isnewchat",map);
	}

	public int insertMsg(Map map) {
		System.out.println("메세지값잘넘어가나"+map);
		return template.insert("sendMessage", map);	//혹시 마지막 메시지보낸 사람 정보필요하면 수정해야함
	}
	
	public List findAllMsg(Map map) {
		return template.selectList("findAllMsg",map);
	}
	
	public ChatDto findNickbyno(Map map) {
		return template.selectOne("findNickbyemail",map);
	}
	
	public List findAllMember(Map map) {
		return template.selectList("findAllMember",map);
	}
	
}