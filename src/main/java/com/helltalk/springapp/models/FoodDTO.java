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
	private String food_no;
	private String food_name;
	private String food_kcal;
	private String allergy;
	private String food_count;
	private String food_info;
}
