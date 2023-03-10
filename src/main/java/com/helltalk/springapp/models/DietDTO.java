package com.helltalk.springapp.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DietDTO {
	//식단
	private String diet_no;
	private String diet_name;
	private int diet_dateCount;
	private String diet_totalKcal;
	private java.sql.Date diet_date;
	
	//한끼
	private String eat_no;
	private String eat_status;
	
}