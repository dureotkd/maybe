package com.sbs.meet.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.meet.dao.ReplyDao;
import com.sbs.meet.dto.ArticleReply;
import com.sbs.meet.util.Util;

@Service
public class ReplyService {
	@Autowired
	ReplyDao replyDao;

	public void writeReply(Map<String, Object> param) {
		replyDao.writeReply(param);
	}

	public List<ArticleReply> getForPrintArticleReplies(@RequestParam Map<String, Object> param) {
		return replyDao.getForPrintArticleReplies(param);
	}

	public int getRepliesCount(int loginedMemberId) {
		return replyDao.getRepliesCount(loginedMemberId);
	}

	public List<ArticleReply> getForPrintArticleRepliesByMyArticle(int loginedMemberId) {
		return replyDao.getForPrintArticleRepliesByMyArticle(loginedMemberId);
	}

	
	
}	
