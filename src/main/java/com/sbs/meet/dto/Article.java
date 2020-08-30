package com.sbs.meet.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Article {
	private int id;
	private int memberId;
	private int displayStatus;
	private String regDate;
	private String tag;
	private String updateDate;
	private String title;
	private String body;
	private Map<String, Object> extra;
	
	private String getCustomDate() {
		
		// 오늘
		Date today = new Date();
	    SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	    String toDay = date.format(today);
	    
	    Calendar cal = Calendar.getInstance();
	    
	    String dateFormat = this.getRegDate();
	    
	  
	    // 모르것다 담에하자
	    
	    return toDay;
	}

	public String getRegDateFormat2() {
		String startTime = this.getRegDate();
		// This could be MM/dd/yyyy, you original value is ambiguous
		SimpleDateFormat input = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date dateValue = input.parse(startTime);
			SimpleDateFormat transFormat = new SimpleDateFormat("MM.dd,EEE");
			String to = transFormat.format(dateValue);
			return to;
		} catch (ParseException e) {
			return this.getRegDate();
		}
	}

}
