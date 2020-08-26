package com.sbs.meet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.meet.dto.Message;

@Mapper
public interface MessageDao {

	void writeMessage(Map<String, Object> param);

	List<Message> getForPrintMessagesAjax(Map<String, Object> param);
	
}
