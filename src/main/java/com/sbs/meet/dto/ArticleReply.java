package com.sbs.meet.dto;

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
}
