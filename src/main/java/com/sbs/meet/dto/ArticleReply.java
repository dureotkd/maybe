package com.sbs.meet.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ArticleReply {
	private int id;
	private int articleId;
	private int memberId;
	private int displayStatus;
	private int readStatus;
	private String regDate;
	private String updateDate;
	private String body;
	private Map<String, Object> extra;
	
	private static class TIME_MAXIMUM {
		public static final int SEC = 60;
		public static final int MIN = 60;
		public static final int HOUR = 24;
		public static final int DAY = 30;
		public static final int MONTH = 12;
	}
	
	public String getRegDateFormat() {

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date to = null;
		try {
			to = transFormat.parse(this.regDate);
		} catch (ParseException e) {
		}

		long curTime = System.currentTimeMillis();
		long regTime = to.getTime();
		long diffTime = (curTime - regTime) / 1000;

		String msg = null;

		if (diffTime < TIME_MAXIMUM.SEC) {
			// sec
			msg = diffTime + "초전";
		} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.MIN) {
			// min
			msg = diffTime + "분전";
		} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.HOUR) {
			// hour
			msg = diffTime + "시간전";
		} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.DAY) {
			// day
			msg = diffTime + "일전";
		} else if ((diffTime /= TIME_MAXIMUM.MONTH) < TIME_MAXIMUM.MONTH) {
			// month
			msg = diffTime + "달전";
		} else {
			msg = (diffTime /= TIME_MAXIMUM.MONTH) + "년 전";
		}
		
		return msg;

	}
	
}
