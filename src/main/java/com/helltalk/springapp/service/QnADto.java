package com.helltalk.springapp.service;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
public class QnADto {
	private String q_no;
	private String u_no;
	private String q_title;
	private String q_content;
	private java.sql.Date q_postdate;
	private java.sql.Date q_adate;
	private String q_answer;
	private int q_view;
	
	
	//작성자 출력용
	private String u_email;
	private int r;
}

