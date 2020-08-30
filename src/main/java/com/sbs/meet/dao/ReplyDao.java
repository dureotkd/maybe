package com.sbs.meet.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.meet.dto.ArticleReply;
@Mapper
public interface ReplyDao {

	void writeReply(Map<String, Object> param);

	List<ArticleReply> getForPrintArticleReplies(@RequestParam Map<String, Object> param);

	int getRepliesCount(int loginedMemberId);

	List<ArticleReply> getForPrintArticleRepliesByMyArticle(int loginedMemberId);

	Map<String, Object> updateReadStatus(int id);

}
