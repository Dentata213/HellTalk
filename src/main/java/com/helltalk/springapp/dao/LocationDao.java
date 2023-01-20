//package com.helltalk.springapp.dao;
//
//import java.util.ArrayList;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.stereotype.Repository;
//
//import com.sun.jdi.Location;
//
//@Repository
//public class LocationDao {
//	
//	public int insertCoordinate(SqlSessionTemplate sqlSession, LocationDto l) {
//		return sqlSession.insert("locationMapper.insertCoordinate",l);
//	}
//
//	public int selectListCount(SqlSessionTemplate sqlSession, LocationDto l) {
//		return sqlSession.selectOne("locationMapper.selectListCount",l);
//	}
//	public int updateCoordinate(SqlSessionTemplate sqlSession, LocationDto l) {
//		return sqlSession.update("locationMapper.updateCoordinate",l);
//	}
//
//	public ArrayList<LocationDto> selectMapList(SqlSessionTemplate sqlSession) {
//		return (ArrayList)sqlSession.selectList("locationMapper.selectMapList");
//	}
//
//}
