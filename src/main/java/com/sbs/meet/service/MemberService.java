package com.sbs.meet.service;

import java.sql.Date;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.sbs.meet.dao.MemberDao;
import com.sbs.meet.dto.File;
import com.sbs.meet.dto.Member;
import com.sbs.meet.dto.ResultData;
import com.sbs.meet.util.Util;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MailService mailService;
	@Autowired
	private AttrService attrService;
	@Autowired
	private FileService fileService;
	@Value("${custom.siteName}")
	private String siteName;

	public boolean checkNicknameJoinable(String nickname) {
		
		return memberDao.getNicknameDupCount(nickname);
	}

	public int join(Map<String, Object> param) {
		memberDao.join(param);
		int id = Util.getAsInt(param.get("id"));

		String fileIdsStr = (String) param.get("fileIdsStr");

		if (fileIdsStr != null && fileIdsStr.length() > 0) {
			List<Integer> fileIds = Arrays.asList(fileIdsStr.split(",")).stream().map(s -> Integer.parseInt(s.trim()))
					.collect(Collectors.toList());
			// 파일이 먼저 생성된 후에, 관련 데이터가 생성되는 경우에는, file의 relId가 일단 0으로 저장된다.
			// 그것을 뒤늦게라도 이렇게 고처야 한다.
			for (int fileId : fileIds) {
				fileService.changeRelId(fileId, id);
			}
		}

		sendJoinCompleteMail((String) param.get("email"));

		return id;
	}

	private void sendJoinCompleteMail(String email) {
		String mailTitle = String.format("[%s] 가입이 완료되었습니다.", siteName);

		StringBuilder mailBodySb = new StringBuilder();
		mailBodySb.append("<h1>가입이 완료되었습니다.</h1>");

		mailService.send(email, mailTitle, mailBodySb.toString());
	}

	public Member getMemberByEmail(String email) {
		return memberDao.getMemberByEmail(email);
	}

	public Member getMemberById(int id) {
		
		Member member = memberDao.getMemberById(id);
		
		List<File> files = fileService.getFiles("member", member.getId(), "common", "attachment");

		Map<String, File> filesMap = new HashMap<>();

		for (File file : files) {
			filesMap.put(file.getFileNo() + "", file);
		}

		Util.putExtraVal(member, "file__common__attachment", filesMap);
		
		return member;
	}

	public String getModifyPrivateAuthCode(int loginedMemberId) {
		String authCode = UUID.randomUUID().toString();
		attrService.setValue("member__" + loginedMemberId + "__extra__modifyPrivateAuthCode", authCode);
		return authCode;
	}

	public boolean isValidModifyPrivateAuthCode(int loginedMemberId, String authCode) {
		String authCodeOnDB = attrService.getValue("member__" + loginedMemberId + "__extra__modifyPrivateAuthCode");

		return authCodeOnDB.equals(authCode);
	}

	public void doModifyPrivate(int loginedMemberId, String loginPw) {
		
		// 비밀번호 수정시 useTempPw 삭제
		attrService.remove("member", loginedMemberId, "extra", "useTempPw");
		
		memberDao.doModifyPrivate(loginedMemberId, loginPw);
	}

	public Member doFindLoginId(String nickname, String name) {
		return memberDao.doFindLoginId(nickname, name);
	}

	public boolean checkEmailJoinable(String email) {
		return memberDao.getEmailDupCount(email);
	}

	public Member getMemberByEmailForFindLoginPw(String email) {
		return memberDao.getMemberByEmailForFindLoginPw(email);
	}

	public void doUpdateTempLoginPw(String loginPw, String email) {
		memberDao.doUpdateTempLoginPw(loginPw, email);
	}

	public void sendUpdateTempLoginPw(String tempPw, String email) {
		String mailTitle = String.format("[%s] 입니다. 귀하의 임시패스워드입니다!", siteName);
		StringBuilder mailBodySb = new StringBuilder();
		mailBodySb.append(String.format("<h1>임시 패스워드 : %s </h1>",tempPw));
		mailService.send(email, mailTitle, mailBodySb.toString());
	}

	public boolean isNeedToChangeaPasswordForTemp(int loginedMemberId) {
		String val = attrService.getValue("member",loginedMemberId,"extra","useTempPw");
		
		if ( val == null ) {
			return false;
		}
		
		return val.equals("1");
	}

	public int setValue(Member member) {
		return attrService.setValue("member",member.getId(),"extra","useTempPw","1");
	}


	public void doMyInfoEdit(String email, String name, String nickname, String introduce, int id) {
		memberDao.doMyInfoEdit(email,name,nickname,introduce,id);
	}

	public int getArticleCount(int memberId) {
		return memberDao.getArticleCount(memberId);
	}


	public void actionUpdetaSessionKey(String sessionId, Date sessionLimit, String email) {
		memberDao.actionUpdetaSessionKey(sessionId, sessionLimit, email);
	}

	public Member checkUseWithSessionKey(String sessionId) {
		return memberDao.checkUseWithSessionKey(sessionId);
	}

	public void applyToFollow(int memberId, int loginedMemberId) {
		memberDao.applyToFollow(memberId,loginedMemberId);
	}

	public File getUserAvatarImg(int memberId) {
		return memberDao.getUserAvatarImg(memberId);
	}

	public void doUpdateLevel(int memberId) {
		memberDao.doUpdateLevel(memberId);
	}

	public List<Member> getAllMember() {
		return memberDao.getAllMember();
	}

	public int getMsgNoticeCount(int loginedMemberId) {
		return memberDao.getMsgNoticeCount(loginedMemberId);
	}

	public int getLikePointCount(int id) {
		return memberDao.getLikePointCount(id);
	}

	public int getRepliesCount(int loginedMemberId) {
		return memberDao.getRepliesCount(loginedMemberId);
	}

	public int getMyLikePoint(int loginedMemberId) {
		return memberDao.getMyLikePoint(loginedMemberId);
	}

	public int getRepliesCountByMe(int loginedMemberId) {
		return memberDao.getRepliesCountByMe(loginedMemberId);
	}


	

}
