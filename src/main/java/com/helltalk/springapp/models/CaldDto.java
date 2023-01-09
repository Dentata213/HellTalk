package com.helltalk.springapp.models;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CaldDto {
	
	private String u_no;  // 
	private String cald_no;
	private String cald_title;
	private String cald_content;  //erd에 추가해야 함
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private java.sql.Date cald_startdate;
	private java.sql.Date cald_enddate;
	private String cald_color;
	private String u_id;	

}
