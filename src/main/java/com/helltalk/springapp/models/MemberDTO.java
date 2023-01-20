package com.helltalk.springapp.models;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
@Data


public class MemberDTO {

	private int u_no;
	private String u_id;
	private String u_pw;
	private String u_nickname;
	private String u_gender;
	private String u_phoneno;
	private String u_email;
	private String u_birth;
	private String u_height;
	private String u_weight;
	private Date u_enterdate;
	private String u_status;
	private String u_kind;
	private int u_kakao;
	
	
	
}
