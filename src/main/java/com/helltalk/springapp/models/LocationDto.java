package com.helltalk.springapp.models;

import lombok.NoArgsConstructor;

import lombok.Setter;
import lombok.ToString;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode


public class LocationDto {

	private int M_ID;
	private String M_KEYWORD;
	private float M_XCOORD;
	private float M_YCOORD;
	private int M_PHONENO;
	private String M_ADDRESS;
	private String M_COMMENT;
	private String M_CATEGORY;
	private String M_CONTENT;
	private int M_TRAINER;
	private int U_NO;
	
	
}
