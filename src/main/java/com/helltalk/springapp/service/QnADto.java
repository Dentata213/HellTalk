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
	public String Q_NO;

	public String Q_TITLE;

	public String Q_CONTENT;

	public int Q_VIEW;

	public String Q_POSTDATE;

	public String Q_ADATE;

	public String Q_ANSWER;

	@Override
	public String toString() {
		return "QnADto [Q_NO=" + Q_NO + ", Q_TITLE=" + Q_TITLE + ", Q_CONTENT=" + Q_CONTENT + ", Q_VIEW=" + Q_VIEW
				+ ", Q_POSTDATE=" + Q_POSTDATE + ", Q_ADATE=" + Q_ADATE + ", Q_ANSWER=" + Q_ANSWER + "]";
	}
	
	


}

