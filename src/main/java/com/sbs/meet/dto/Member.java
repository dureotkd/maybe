package com.sbs.meet.dto;

import java.util.Map;

import javax.servlet.http.HttpSession;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {
	private int id;
	private int mailStatus;
	private int delStatus;
	private HttpSession session;
	private String sessionId;
	private String regDate;
	private String updateDate;
	private String delRegDate;
	private String email;
	private String nickname;
	private String name;
	private String loginPw;
	private String introduce;
	private String level;
	private Map<String, Object> extra;
}
