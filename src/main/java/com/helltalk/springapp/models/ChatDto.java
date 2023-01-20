package com.helltalk.springapp.models;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Repository
public class ChatDto {
	
	private int roomNo;
	private String roomName;
	
	@Override
	public String toString() {
		return "Room [roomNumber=" + roomNo + ", roomName=" + roomName + "]";
	}

}
