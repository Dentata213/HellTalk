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
	private String food_maker;
	private String food_size;
	private String food_kcal;
	private String food_allergy;
	private String food_count;
	private String food_tan;
	private String food_dan;
	private String food_fat;
	private String food_col;
	private String food_na;
}