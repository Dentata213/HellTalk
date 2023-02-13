package com.helltalk.springapp.models;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Repository
public class ChatDto {
	
	private int room_no;
	private String room_name;
	private String u_email;
	private int u_no;
	private String message;
	private String time;
	private int mno;
	private String u_nickname;
	private String u_kind;
	
	@Override
	public String toString() {
		return "roomNno="+room_no+",roomName="+ room_name+",uemail="+u_email+",uno="+u_no+",time="+time+",mno="+mno+",message="+message+",nickname="+u_nickname+",ukind="+u_kind;
	}

}
