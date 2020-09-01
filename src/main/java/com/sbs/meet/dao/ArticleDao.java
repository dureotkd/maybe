package com.sbs.meet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.meet.dto.Article;
import com.sbs.meet.dto.ArticleLike;
import com.sbs.meet.dto.ArticleReply;

@Mapper
public interface ArticleDao  {

	void doWriteArticle(Map<String, Object> param);

	Article getForPrintPrison(String searchKeyword);

	List<Article> getForPrintArticles();

	Article getForPrintOneArticle(int id);

	List<ArticleReply> getForPrintArticleReplies();

	List<Article> getForPrintArticles(@RequestParam Map<String, Object> param);

	List<Article> getForPrintArticles2(int memberId);

	Article getForPrintOneUserImg(int id, int memberId);

	int getArticleReplyCount();

	void likeArticle(int id, int loginedMemberId);

	int getLikePointByMemberId(int id, int loginedMemberId);

	int getArticleCount(int memberId);

	int getLikePoint(@Param("id") int id);

	int getArticleLikeAvailableCount(int id, int loginedMemberId);

	List<ArticleLike> getForPrintArticleLikesByMyArticle(int loginedMemberId);

	int getArticlesLikeCount(int id);

	Article getLikeKing();

	List<Article> getLikeKingLimitFive();

	Map<String, Object> updateReadStatus(int loginedMemberId);

	List<Article> getForPrintArticlesInFollow(int loginedMemberId);

	void doDeleteReplyAjax(int id);
	
}
