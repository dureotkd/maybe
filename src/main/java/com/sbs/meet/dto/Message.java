package com.sbs.meet.dto;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Message {
	private String body;
	private String regDate;
	private String delRegDate;
	private int id;
	private int delStatus;
	private int displayStatus;
	private int readStatus;
	private int fromId;
	private int toId;
	
	private Map<String, Object> extra;
	
}
