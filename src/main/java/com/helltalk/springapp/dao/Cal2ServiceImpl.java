package  com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.service.Cal2Dto;
import com.helltalk.springapp.service.CalService;


@Service("calService2")
public class Cal2ServiceImpl implements CalService<Cal2Dto> {

	@Autowired
	private Cal2Dao dao;
	
	@Override
	public List<Cal2Dto> selectList(Map map, HttpServletRequest req) {
		List<Cal2Dto> lists = dao.findAll2(map);	
		return dao.findAll2(map);		
	}

	@Override
	public Cal2Dto selectOne(Map map) {
		Cal2Dto record=dao.findRecordByNo(map);
		return record;
	}

	@Override
	public int insert(Map map) {
		int newcal2=dao.insert(map);
		System.out.println("추가된 키번호?"+newcal2);		
		return newcal2;
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
