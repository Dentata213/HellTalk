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
public class FoodInfoDTO {
	private String fInfo_no;
	private String tan;
	private String dan;
	private String fat;
	private String col;
	private String na;
}
