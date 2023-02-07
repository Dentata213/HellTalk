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
public class QnADto {
	private String Q_NO;
	private String U_NO;
	private String Q_TITLE;
	private String Q_CONTENT;
	private String Q_POSTDATE;
	private String Q_ADATE;
	private String Q_ANSWER;
	private int Q_VIEW;
	
	//작성자 출력용
	private String U_EMAIL;
	@Override
	public String toString() {
		return "QnADto [Q_NO=" + Q_NO + ", Q_TITLE=" + Q_TITLE + ", Q_CONTENT=" + Q_CONTENT + ", Q_VIEW=" + Q_VIEW
				+ ", Q_POSTDATE=" + Q_POSTDATE + ", Q_ADATE=" + Q_ADATE + ", Q_ANSWER=" + Q_ANSWER + "]";
	}
	
	


}

