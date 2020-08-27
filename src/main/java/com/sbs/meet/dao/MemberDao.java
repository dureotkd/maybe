package com.sbs.meet.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sbs.meet.dto.File;
import com.sbs.meet.dto.Member;

@Mapper
public interface MemberDao {

	boolean getNicknameDupCount(String nickname);

	void join(Map<String, Object> param);

	Member getMemberByEmail(String email);

	Member getMemberById(@Param("id") int id);

	void doModifyPrivate(int id, String loginPw);

	Member doFindLoginId(String nickname, String name);

	boolean getEmailDupCount(String email);

	Member getMemberByEmailForFindLoginPw(String email);

	void doUpdateTempLoginPw(String loginPw, String email);

	void doMyInfoEdit(Map<String, Object> param);

	void doMyInfoEdit(String email, String name, String nickname, String introduce, int id);

	int getArticleCount(int memberId);

	void actionUpdetaSessionKey(String sessionId, Date sessionLimit, String email);

	Member checkUseWithSessionKey(String sessionId);

	void applyToFollow(int memberId, int loginedMemberId);

	File getUserAvatarImg(int memberId);

	void doUpdateLevel(int memberId);

	List<Member> getAllMember();

	int getMsgNoticeCount(int loginedMemberId);

	int getLikePointCount(int id);

	int getRepliesCount(int loginedMemberId);

	int getMyLikePoint(int loginedMemberId);

	int getRepliesCountByMe(int loginedMemberId);

}
