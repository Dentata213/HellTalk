package com.helltalk.springapp.service;


import lombok.Getter;

import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class ExerciseDTO {
	
	/*EXERCISEKIND*/
	//운동부위 no
	private String ek_no;
	//운동부위명
	private String ek_kind;
	
	/*EXERCISE*/
	//운동번호
	private String e_no;
	//운동이름
	private String e_name;
	//필요기구
	private String e_equipment;
	//소비칼로리
	private String e_kcal;
	//사용자기록수
	private String e_count;
	//운동설명
	private String e_description;
	//운동URL
	private String e_url;
	//운동시간
	private String e_time;
	
	//ROUTINE
	//루틴번호
	private String rout_no;
	//루틴이름
	private String rout_name;
	//루틴난이도
	private String rout_level;
	//루틴유형(홈트 or 피트니스)
	private String rout_category;
	//루틴효과
	private String rout_effect;
	//루틴 성별
	private String rout_gender;
	//루틴시간
	private String rout_time;
	//루틴모드
	private String rout_mode;
	//루틴시작일
	private String rout_startdate;
	//루틴끝일
	private String rout_enddate;
	//공개여부
	private String rout_display;

	//DAYROUTINE
	//데이루틴번호
	private String dr_no;
	//데이
	private String day;
	
	//EXERCISELIST
	//운동루틴번호
	private String el_dayno;
	//운동시간
	private String el_time;
	//운동 총 칼로리
	private String el_totalkcal;
	
	
	//맴버 DTO
	//nickname
	private String u_nickname;
	//성별
	private String u_gender;
	
		

	
}
