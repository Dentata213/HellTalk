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
public class FoodDTO {
	//음식
	private String food_cd;
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