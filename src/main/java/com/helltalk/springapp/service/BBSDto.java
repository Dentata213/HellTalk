package com.helltalk.springapp.service;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BBSDto {
	private String id;
	private String no;
	private String title;
	private String u_nickname;
	private String content;
	private String comment;
	private int viewCount;
	private Date postDate;
	private int likeCount;
	private boolean like;
	
	
	//아래는 게시판 테이블 생성시 컬럼에서 제외
	private String name;
	//각 글 번호(no)에 따른 댓글 총수 저장용
	private int commentCount;

}


