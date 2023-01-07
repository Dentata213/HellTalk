package com.helltalk.springapp.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.service.CalService;
import com.helltalk.springapp.service.CaldDto;

@Service("caldService")
public class CaldServiceImpl implements CalService<CaldDto> {

	@Autowired
	private CaldDao dao;
	
	@Override
	public List<CaldDto> selectList(Map map, HttpServletRequest req) {
		List<CaldDto> list = dao.findAll(map);
		return dao.findAll(map);
	}

	@Override
	public CaldDto selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) {
	 int newcald=dao.inset(map);
	 System.out.println("추가된 키번호:"+newcald);
		return newcald;
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
