package com.sbs.meet.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sbs.meet.dto.File;
import com.sbs.meet.dto.Friend;
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

	String isNeedToChangePwPass3Months(int loginedMemberId);

	void updateActReadStatus(int loginedMemberId);

	void updateActReadStatusInReply(int loginedMemberId);

	void doChangeProfile(int loginedMemberId);

	void doActionFollow(int followId, int followerId);

	void doDeleteFollow(int followId, int followerId);

	int getMyFollowerCount(int loginedMemberId);

	List<Friend> getForPrintMyFollow(int loginedMemberId);

	void updateActReadStatusInFollow(int loginedMemberId);

	int getFollowCount(int memberId);

	int getFollowerCount(int memberId);

	int getFollowingConfirm(int memberId, int loginedMemberId);

	void doUpdateLevel5(int memberId);

	void doUpdateLevel10(int memberId);

	List<Member> getForPrintNotFollow(int loginedMemberId);

	int getFollowCross(int memberId, int loginedMemberId);

}
