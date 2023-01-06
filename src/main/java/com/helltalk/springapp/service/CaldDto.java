package com.helltalk.springapp.service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CaldDto {
	
	private String u_no;  // 
	private String cald_title;
	private String cald_content;  //erd에 추가해야 함
	private java.sql.Date cald_startDate;
	private java.sql.Date cald_endDate;
	private String cald_color;
	private String u_id;	

}
