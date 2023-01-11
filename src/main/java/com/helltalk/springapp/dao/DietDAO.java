package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.models.DietDTO;

@Repository
public class DietDAO {
		//마이바티스 오라클 주입
		@Autowired
		private SqlSessionFactory sqlMapper;
		@Autowired
		private SqlSessionTemplate template;
		
		public List selectList(Map map) {
			return template.selectList("dietSelectList",map);
		}
		
		public int insert(Map map) {
			return template.insert("dietInsert",map);
		}
		
		public int update(Map map) {
			return template.update("dietUpdate",map);
		}
		
		public int delete(Map map) {		
			return template.delete("dietDelete",map);
		}

		
		
}
