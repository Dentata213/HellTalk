package com.helltalk.springapp.models;

import java.util.ArrayList;



public interface LocationService {
	
	// 존재여부 확인
	int selectListCount(LocationDto l);
		
	// 좌표 저장
	int insertCoordinate(LocationDto l);

	// 좌표 업데이트
	int updateCoordinate(LocationDto l);
		
	// 좌표 리스트 검색
	ArrayList<LocationDto> selectMapList();
	
}
