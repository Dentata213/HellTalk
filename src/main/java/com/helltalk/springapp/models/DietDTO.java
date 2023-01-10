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
	private String diet_dateCount;
	private String diet_breakfast;
	private String diet_lunch;
	private String diet_dinner;
	private String diet_totalKcal;
	private java.sql.Date diet_date;
	
	//한끼
	private String e_no;
	private String e_mode;
	private String e_count;
	private java.sql.Date e_date;
	
	//음식
	private String food_no;
	private String food_name;
	private String food_kcal;
	private String allergy;
	private String food_count;
	private String food_info;
	
	//영양성분
	private String fInfo_no;
	private String tan;
	private String dan;
	private String fat;
	private String col;
	private String na;
	
	

}
