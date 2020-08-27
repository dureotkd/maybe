package com.sbs.meet.dto;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ArticleLike {
	private String regDate;
	private int id;
	private int articleId;
	private int memberId;
	private int point;
	private int readStatus;
	private Map<String, Object> extra;
	
}
