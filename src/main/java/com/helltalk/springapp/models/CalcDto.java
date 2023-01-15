package com.helltalk.springapp.models;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CalcDto {

	private String calc_no;
	private String u_no;
	private String rout_no;
	private String calc_color;
	private String calc_checked;
	private String rout_name;
	private String rout_content;
	private java.sql.Date rout_startdate;
	private java.sql.Date rout_enddate;
		
}
