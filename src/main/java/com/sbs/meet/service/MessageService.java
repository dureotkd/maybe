package com.sbs.meet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.meet.dao.MessageDao;
import com.sbs.meet.dto.Message;

@Service
public class MessageService {
	@Autowired
	MessageDao messageDao;
	public void writeMessage(Map<String, Object> param) {
		messageDao.writeMessage(param);
	}
	public List<Message> getForPrintMessagesAjax(Map<String, Object> param) {
		return messageDao.getForPrintMessagesAjax(param);
	}
	public void doUpdateReadStatus(int loginedMemberId) {
		messageDao.doUpdateReadStatus(loginedMemberId);
	}
	public int getMsgNoticeCount(int loginedMemberId) {
		return messageDao.getMsgNoticeCount(loginedMemberId);
	}

}
