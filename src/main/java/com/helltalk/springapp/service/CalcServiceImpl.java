package com.helltalk.springapp.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.CalcDao;
import com.helltalk.springapp.models.CalService;
import com.helltalk.springapp.models.CalcDto;

@Service("calcService")
public class CalcServiceImpl implements CalService<CalcDto> {

	@Autowired
	private CalcDao dao;

	@Override
	public List<CalcDto> selectList(Map map, HttpServletRequest req) {	
		List<CalcDto> lists = dao.findAllc(map);  	
		return dao.findAllc(map);
	}

	@Override
	public int insert(Map map) {
		return 0;
	}
	
	@Override
	public CalcDto selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Map selectOneR(Map map) throws ParseException {
		Map list = dao.findRout(map);	
		Map listmap = new HashMap<>();
		System.out.println("이거 확인!:"+list);
		List<CalcDto> start = dao.findStart(map);		
		if(list == null) {
			System.out.println("이게클릭한 날짜"+map.get("calcStartD"));
			System.out.println("날짜들..."+start.get(0).getRout_startdate());			
			SimpleDateFormat dataformat = new SimpleDateFormat("yyyy-MM-dd");
			
			int isCoverS = 0;
			int isCoverE =0;
			Date date =null;
			Date date2 =null;
			Date date3 =null;
			long cdate = 0;
			long sdate=0;
		    
		int i = 0;
		while(i<start.size()) {
			 date =dataformat.parse(map.get("calcStartD").toString());	
			cdate = date.getTime(); //계산할 수 있게 시간으로 쪼개기
			 date2 =dataformat.parse(start.get(i).getRout_startdate().toString());
			sdate = date2.getTime();
			 date3 =dataformat.parse(start.get(i).getRout_enddate().toString());
			 isCoverS = date.compareTo(date2); //클릭한 날짜가 크면 양수
			 isCoverE = date.compareTo(date3);
			if(isCoverS > 0 & isCoverE <= 0) {
				  System.out.println("운동루틴 들어있는 날짜들");
				  System.out.println(cdate-sdate); 
				  int dayTotime = Long.valueOf(cdate-sdate).intValue();
				  //2일86400000, 3일172800000,4일259200000 ,5일 345600000, 6일432000000 ,7일518400000
				switch(dayTotime){
					case 86400000:					
						listmap.put("DAY",start.get(i).getRout_startdate().toString()+"의DAY2");
						break;
					case 172800000:
						listmap.put("DAY", start.get(i).getRout_startdate().toString()+"의DAY3");
						break;
					case 259200000:
						listmap.put("DAY", start.get(i).getRout_startdate().toString()+"의DAY4");
						break;	
					case 345600000:
						listmap.put("DAY", start.get(i).getRout_startdate().toString()+"의DAY5");
						break;
					case 432000000:
						listmap.put("DAY", start.get(i).getRout_startdate().toString()+"의DAY6");
						break;
					default:
						listmap.put("DAY", start.get(i).getRout_startdate().toString()+"의DAY7");
						break;
				 }  	  			  
				break;
			} else i++;
		};
		
		}////if
		    listmap.put("list",list);
			System.out.println("대체 뭘가져온거야.."+listmap);
			System.out.println("비교"+list);
		return listmap;
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
	public String findUserByNo(Map map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
