package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.DietDAO;
import com.helltalk.springapp.models.DietDTO;

@Service("dietService")
public class DietServiceImpl implements DietService<DietDTO>{
	
	@Autowired
	private DietDAO dao;
	
	@Override
	public List<DietDTO> selectList(Map map, HttpServletRequest req) {
		List lists= dao.selectList(map);
		return null;
	}

	@Override
	public DietDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
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
	
}
