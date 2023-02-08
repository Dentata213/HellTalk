package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.BackendDAO;
import com.helltalk.springapp.models.BackendService;
import com.helltalk.springapp.models.PaymentDTO;


@Service
public class BackendServiceImpl implements BackendService{

	@Autowired
	private BackendDAO dao;
	
	
	@Override
	public List<MemberDTO> selectAllUser(Map map) {
		List<MemberDTO> lists = dao.selectAllUser(map);
		return lists;
	}

	@Override
	public List<BBSDto> selectAllWritings(Map map) {
		List<BBSDto> lists = dao.selectAllWritings(map);
		return lists;
	}

	@Override
	public List<PaymentDTO> selectAllReceipt(Map map) {
		List<PaymentDTO> lists = dao.selectAllReceipt(map);
		return lists;
	}

	@Override
	public int blockUser(Map map) {
		return dao.blockUser(map);
	}

	public int kickUser(Map map) {
		return dao.kickUser(map);
	}

	public int removeOne(Map map) {
		return dao.removeOne(map);
		
	}
	
	
	private int pageSize=15;
	private int blockPage=3;
	
	public ListPagingData<BBSDto> selectList(Map map, int nowPage, HttpServletRequest req) {
		//페이징을 위한 로직 시작]
		//전체 레코드수	
		map.put("value", "QNA");
		int totalRecordCount=dao.getTotalRecordCount(map);
		System.out.println(totalRecordCount);
		//페이징을 위한 기본정보 설정
		map.put(PagingUtil.PAGE_SIZE, pageSize);
		map.put(PagingUtil.BLOCK_PAGE, blockPage);
		map.put(PagingUtil.TOTAL_COUNT, totalRecordCount);
		map.put(PagingUtil.NOW_PAGE, nowPage);
		//나머지 페이징과 관련된 값들을  얻기 위한 메소드 호출
		//그러면 총 페이지수와 시작/끝 행번호가 맵에 설정됨
		PagingUtil.setMapForPaging(map);		
		//글 전체 목록 얻기
		List lists= dao.findAll(map);
		String searchString="";
		if(map.containsKey("searchWord")) {
			searchString+="searchColumn="+map.get("searchColumn")+"&searchWord="+map.get("searchWord")+"&";
		}
		
		//페이징 표시 문자열 얻기
		String pagingString=PagingUtil.pagingBootStrapStyle(
				totalRecordCount, 
				pageSize, 
				blockPage, 
				nowPage,
				req.getContextPath()+"/onememo/bbs/List.do?"+searchString);
		//페이징과 관련된 정보 및 모든 목록을 담는 ListPagingData객체 생성		
		ListPagingData<BBSDto> listPagingData = ListPagingData.builder()
													.lists(lists)//글 전체 목록 설정
													.map(map)//페이징 관련 데이타 저장된 맵 설정
													.pagingString(pagingString)//페이징 표시 문자열 설정
													.build();
		return listPagingData;
	}

	public ListPagingData<QnADto> selectAllQnA(Map map, HttpServletRequest req, int nowPage) {
			//글 전체 목록 얻기
		
		int totalRecordCount=dao.getTotalRecordCount(map);//검색시에도 페이징 해야 함으로 맵을 넘겨준다
		//페이징을 위한 기본정보 설정
		map.put(PagingUtil.PAGE_SIZE, pageSize);
		map.put(PagingUtil.BLOCK_PAGE, blockPage);
		map.put(PagingUtil.TOTAL_COUNT, totalRecordCount);
		map.put(PagingUtil.NOW_PAGE, nowPage);
		//나머지 페이징과 관련된 값들을  얻기 위한 메소드 호출
		//그러면 총 페이지수와 시작/끝 행번호가 맵에 설정됨
		PagingUtil.setMapForPaging(map);		
		//글 전체 목록 얻기
		List lists= dao.findAllQnA(map);
		String searchString="";
		if(map.containsKey("searchWord")) {
			searchString+="searchColumn="+map.get("searchColumn")+"&searchWord="+map.get("searchWord")+"&";
		}
		
		//페이징 표시 문자열 얻기
		String pagingString=PagingUtil.pagingBootStrapStyle(
				totalRecordCount, 
				pageSize, 
				blockPage, 
				nowPage,
				req.getContextPath()+"/onememo/bbs/List.do?"+searchString);
		//페이징과 관련된 정보 및 모든 목록을 담는 ListPagingData객체 생성		
		ListPagingData<QnADto> listPagingData = ListPagingData.builder()
												.lists(lists)//글 전체 목록 설정
												.map(map)//페이징 관련 데이타 저장된 맵 설정
												.pagingString(pagingString)//페이징 표시 문자열 설정
												.build();
		
		return listPagingData;

	}

	public void updateQnAanswer(Map map) {
		dao.updateQnAanswer(map);
		
	}

	public QnADto selectOneQnA(Map map) {
		return dao.selectOneQnA(map);
		
	}
	
	
}
