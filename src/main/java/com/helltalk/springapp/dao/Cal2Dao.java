package  com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helltalk.springapp.service.Cal2Dto;


@Repository
public class Cal2Dao {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;

	public List findAll2(Map map) {
		//스프링 지원 마이바티스 API(SqlSessionTemplate) 미 사용시
		//1]SqlSession얻기
		SqlSession session= sqlMapper.openSession();		
		//2]selectOne()호출
		List<Cal2Dto> records=session.selectList("findAll2", map);
		//3]close()호출
		session.close();
		return records;
	}
	
	public int insert(Map map) {
		//마이바티스의 insert는 무조건 영향받은 행의 수 반환
		template.insert("calInsert2",map);
		//위 메소드 호출시 "commentInsert"를 가진 쿼리가 실행되어 
		//방금 입력한 행의 번호(키-lno)를 인자로 전달한 Map에 담자
		return Integer.parseInt(map.get("calno2").toString());//Map에 저장된 행의 키(번호)를 꺼내와서 반환하자
	}

	public Cal2Dto findRecordByNo(Map map) {
		System.out.println(map);
		return template.selectOne("FindRecordByNo",map);
	}
	
	
}
