package com.sbs.meet.dto;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Friend {
	private int id;
	private int readStatus;
	private int followId;
	private int followerId;
	private String regDate;
	private Map<String, Object> extra;
}
