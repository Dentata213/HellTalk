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
	private String diet_no;
	private String diet_dateCount;
	private String diet_breakfast;
	private String diet_lunch;
	private String diet_dinner;
	private String diet_totalKcal;
	private java.sql.Date diet_date;
	

}
