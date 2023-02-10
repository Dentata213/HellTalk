package com.helltalk.springapp.service;

import java.sql.Date;

public class MemberDTO{

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
	
	//생성자
	public MemberDTO() {};
	
	public MemberDTO(int u_no, String u_id, String u_pw, String u_nickname, String u_gender, String u_phoneno,
			String u_email, String u_birth, String u_height, String u_weight, Date u_enterdate, String u_status,
			String u_kind, int u_kakao) {
		this.u_no = u_no;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_nickname = u_nickname;
		this.u_gender = u_gender;
		this.u_phoneno = u_phoneno;
		this.u_email = u_email;
		this.u_birth = u_birth;
		this.u_height = u_height;
		this.u_weight = u_weight;
		this.u_enterdate = u_enterdate;
		this.u_status = u_status;
		this.u_kind = u_kind;
		this.u_kakao = u_kakao;
	}

	// 게터/세터
	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_nickname() {
		return u_nickname;
	}

	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getU_phoneno() {
		return u_phoneno;
	}

	public void setU_phoneno(String u_phoneno) {
		this.u_phoneno = u_phoneno;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_height() {
		return u_height;
	}

	public void setU_height(String u_height) {
		this.u_height = u_height;
	}

	public String getU_weight() {
		return u_weight;
	}

	public void setU_weight(String u_weight) {
		this.u_weight = u_weight;
	}

	public Date getU_enterdate() {
		return u_enterdate;
	}

	public void setU_enterdate(Date u_enterdate) {
		this.u_enterdate = u_enterdate;
	}

	public String getU_status() {
		return u_status;
	}

	public void setU_status(String u_status) {
		this.u_status = u_status;
	}

	public String getU_kind() {
		return u_kind;
	}

	public void setU_kind(String u_kind) {
		this.u_kind = u_kind;
	}

	public int getU_kakao() {
		return u_kakao;
	}

	public void setU_kakao(int u_kakao) {
		this.u_kakao = u_kakao;
	}
	
	
}
