package  com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.service.CalDto;
import com.helltalk.springapp.service.CalService;
import com.zaxxer.hikari.HikariDataSource;

@Service("calService")
public class CalServiceImpl implements CalService<CalDto>{

	@Autowired
	private CalDao dao;

	@Override
	public List<CalDto> selectList(Map map, HttpServletRequest req) {
		List<CalDto> lists = dao.findAll(map);	
		return dao.findAll(map);
		
	}

	@Override
	public CalDto selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) {
/*		//영향받은 행의 수가 아니라 새로 입력된 레코드의 키값(lno)를 반환 받는다
		//마이바티스의 insert()는 무조건 영향받은 행의 수를 반환
		int newcal=dao.insert(map);
		System.out.println("추가된 키번호?"+newcal);		
		return newcal;*/
		return 0;
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String findNameByNo(Map map) {
		// TODO Auto-generated method stub
		return null;
	}
}
