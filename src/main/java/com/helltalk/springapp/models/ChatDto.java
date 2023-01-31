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
	
	@Override
	public String toString() {
		return "Room [roomNumber=" + room_no + ", roomName=" + room_name + "]";
	}

}
