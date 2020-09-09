package com.sbs.meet.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.sbs.meet.dto.Article;
import com.sbs.meet.dto.ArticleLike;
import com.sbs.meet.dto.File;
import com.sbs.meet.dto.Friend;
import com.sbs.meet.dto.Member;
import com.sbs.meet.service.ArticleService;
import com.sbs.meet.service.FileService;
import com.sbs.meet.service.MemberService;
import com.sbs.meet.util.Util;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private FileService fileService;

	@RequestMapping("/member/join")
	public String join(Model model) {

		List<Article> articles = articleService.getLikeKingLimitFive();

		for (Article article : articles) {
			List<File> files = fileService.getFiles("article", article.getId(), "common", "attachment");
			if (files.size() > 0) {
				File file = files.get(0);

				if (article.getExtra() == null) {
					article.setExtra(new HashMap<>());
				}

				article.getExtra().put("articleImgUrl",
						"/file/showImg?id=" + file.getId() + "&updateDate=" + file.getUpdateDate());
			}
			Map<String, File> filesMap = new HashMap<>();

			for (File file : files) {
				filesMap.put(file.getFileNo() + "", file);
			}
		}
		model.addAttribute("articles", articles);
		return "member/join";
	}

	@RequestMapping("/member/doJoin")
	public String doJoin(@RequestParam Map<String, Object> param, Model model) {
		Util.changeMapKey(param, "loginPwReal", "loginPw");

		int newMemberId = memberService.join(param);

		String redirectUri = (String) param.get("redirectUri");
		model.addAttribute("redirectUri", redirectUri);

		return "common/redirect";
	}

	@RequestMapping("/member/login")
	public String login(Model model) {

		Article article = articleService.getLikeKing();

		if (article != null) {

			List<File> files = fileService.getFiles("article", article.getId(), "common", "attachment");
			Map<String, File> filesMap = new HashMap<>();

			for (File file : files) {
				filesMap.put(file.getFileNo() + "", file);
			}
			Util.putExtraVal(article, "file__common__attachment", filesMap);
		}

		model.addAttribute("article", article);

		return "member/login";
	}

	@RequestMapping("/member/getEmailDup")
	@ResponseBody
	public String actionGetEmailDup(HttpServletRequest req, HttpServletResponse resp) {
		String email = req.getParameter("email");

		boolean isJoinableEmail = memberService.checkEmailJoinable(email);

		if (isJoinableEmail == false) {
			return "json:{\"msg\":\"사용가능 한 이메일 입니다.\", \"resultCode\": \"S-1\", \"Email\":\"" + email + "\"}";
		} else {
			return "json:{\"msg\":\"이미 사용중인 이메일 입니다.\", \"resultCode\": \"F-1\", \"Email\":\"" + email + "\"}";
		}
	}

	@RequestMapping("/member/getNicknameDup")
	@ResponseBody
	private String actionGetNicknameDup(HttpServletRequest req, HttpServletResponse resp) {
		String nickname = req.getParameter("nickname");

		boolean isJoinableNickname = memberService.checkNicknameJoinable(nickname);

		if (isJoinableNickname == false) {
			return "json:{\"msg\":\"사용가능 한 닉네임 입니다.\", \"resultCode\": \"S-1\", \"Nickname\":\"" + nickname + "\"}";
		} else {
			return "json:{\"msg\":\"이미 사용중인 닉네임 입니다.\", \"resultCode\": \"F-1\", \"Nickname\":\"" + nickname + "\"}";
		}
	}

	@RequestMapping("/member/doLogin")
	public String doLogin(String email, String loginPwReal, String redirectUri, Model model, HttpSession session,
			HttpServletResponse response, String loginChk) {

		String loginPw = loginPwReal;
		Member member = memberService.getMemberByEmail(email);

		if (member == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "존재하지 않는 계정입니다.");
			return "common/redirect";
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			return "common/redirect";
		}

		session.setAttribute("loginedMemberId", member.getId());

		String sessionId = session.getId();

		// 로그인 성공시 로그인 폼에서 쿠키가 체크된 상태로 로그인 요청이 있는지 확인.
		if (loginChk != null) {
			// 쿠키를 생성하고 현재 로그인 되어있을떄 세션의 id를 쿠키에 저장
			Cookie cookie = new Cookie("loginCookie", sessionId);

			// 쿠키를 찾을 경를 컨테스트 경로로 변경해주고???
			// 이때, 사용자 PC에서 쿠키를 보내는 경로가 "/" 로 설정함으로써
			// contextPath 이하의 모든 요청에 대해서 쿠키를 전송할 수 있다
			cookie.setPath("/");

			cookie.setMaxAge(60 * 60 * 24 * 7);
			// 쿠키 적용
			response.addCookie(cookie);
			// 불러와주고
			int setMaxAge = cookie.getMaxAge();
			// 쿠키 유효시간 7일정도
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * setMaxAge));

			memberService.actionUpdetaSessionKey(sessionId, sessionLimit, email);
		}

		// 로그인 된 경우 해당 세션 id와 유효시간을 Member테이블에 세팅..

		// 이때, 가장 중요하게 볼 부분이 쿠키에 Member 객체를 저장하는 것이 아니고!!!!

		// (사실 쿠키는 문자열만 저장되기 때문에 가능하지도 않습니다.)

		// 현재 브라우저의 세션 id를 저장해 놓는 겁니다.

//		이후, AuthenticationInterceptor의 preHandle() 부분에서 
//
//		세션에 Member 객체가 null이 아닌 경우는 로그인 되어 있는 부분이니까 그대로 처리되도록 놔두고, 세션의 UserVO 객체가
//
//		null이지만, 쿠키가 null이 아닌 경우 쿠키에서 sessionId를 꺼내와서 사용자 객체를 반환받도록 작업할 것이다.

		if (redirectUri == null || redirectUri.length() == 0) {
			redirectUri = "home/main";
		}

		int loginedMemberId = member.getId();

		// nullPointer
		//
		boolean isNeedToChangePwPass3Months = memberService.isNeedToChangePwPass3Months(loginedMemberId);

		// boolean int 는 null 을 담을수 없다. 그러니 Strng으로 담아주자..

		if (isNeedToChangePwPass3Months) {
			model.addAttribute("redirectUri", redirectUri);
			model.addAttribute("alertMsg", "비밀번호를 변경안한지 3개월이 되었습니다. 변경해주세요^^");
			return "common/redirect";
		}

		boolean isNeedToChangePasswordForTemp = memberService.isNeedToChangeaPasswordForTemp(loginedMemberId);

		if (isNeedToChangePasswordForTemp) {
			model.addAttribute("redirectUri", redirectUri);
			model.addAttribute("alertMsg", "현재 임시패스워드를 사용중입니다. 비밀번호를 변경해주세요");
			return "common/redirect";
		}

		model.addAttribute("redirectUri", redirectUri);

		return "common/redirect";
	}

	@RequestMapping("/member/doLogout")
	public String doLogout(HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model,
			String redirectUri) {

		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		System.out.println("쿠키 잘왔나 ? : " + loginCookie);

		session.invalidate();

		if (loginCookie != null) {
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);

			Date date = new Date(System.currentTimeMillis());
			// memberService.actionUpdetaSessionKey(session.getId(),date,email);
		}

		if (redirectUri == null || redirectUri.length() == 0) {
			redirectUri = "../member/login";
		}

		model.addAttribute("redirectUri", redirectUri);

		return "common/redirect";
	}

	@RequestMapping("/member/myInfo")
	public String showMyInfo() {
		return "member/myInfo";
	}

	// 비밀번호 수정전 비번확인 form

	@RequestMapping("/member/passwordForPrivate")
	public String lockPasswordForPrivate() {
		return "member/passwordForPrivate";
	}

	@RequestMapping("/member/myInfoEdit")
	public String myInfoEdit(HttpSession session) {

		return "member/myInfoEdit";
	}

	@RequestMapping("/member/doMyInfoEdit")
	public String doMyInfoEdit(String email, String name, String nickname, String introduce, int id, Model model,
			String redirectUri) {

		memberService.doMyInfoEdit(email, name, nickname, introduce, id);

		model.addAttribute("redirectUri", redirectUri);
		return "common/redirect";
	}

	// 비밀번호 수정전 비번 확인실행 form 전달

	@RequestMapping("/member/unlockPasswordForPrivate")
	public String unlockPasswordForPrivate(@RequestParam Map<String, Object> z, String loginPwReal, Model model,
			String redirectUri, HttpServletRequest req) {
//		String loginPw = (String) param.get("loginPwReal");
//		
//		
//		Member loginedMember = (Member)req.getAttribute("loginedMember");
//		
//		int loginedMemberId = loginedMember.getId();
//		// 문제
//		if (loginedMember.getLoginPw().equals(loginPw)) {
//			String authCode = memberService.getModifyPrivateAuthCode(loginedMemberId);	
//			return 	redirectUri = "modifyPrivate?authCode=" + authCode + "";
//		}
//		
//		model.addAttribute("historyBack",true);
//		model.addAttribute("alertMsg",String.format("%s님 비밀번호를 다시 확인해주세요.",loginedMember.getNickname()));
//		
//		return "common/redirect";

		String loginPw = loginPwReal;
		Member loginedMember = (Member) req.getAttribute("loginedMember");

		// 유니크를 꼭 걸어줘야함 안그러면 충돌남.. 유니크 걸어줄 시 -> 새로운 데이터가 들어가는게 아니고 업데이트가 댐 !..

		if (loginedMember.getLoginPw().equals(loginPw) == false) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			return "common/redirect";
		}

		int loginedMemberId = loginedMember.getId();
		String authCode = memberService.getModifyPrivateAuthCode(loginedMemberId);
		redirectUri = "modifyPrivate?authCode=" + authCode + "";
		model.addAttribute("redirectUri", redirectUri);

		return "common/redirect";
	}

	// 본격적인 비밀번호 수정 시작
	@RequestMapping("/member/modifyPrivate")
	public String modifyPrivate() {
		return "member/modifyPrivate";
	}

	// 비밀번호 수정 실행 form 전달
	@RequestMapping("/member/doModifyPrivate")
	public String doModifyPrivate(@RequestParam Map<String, Object> param, HttpServletRequest req, String loginPwReal,
			String redirectUri, Model model) {
		String loginPw = loginPwReal;

		Member loginedMember = (Member) req.getAttribute("loginedMember");
		int loginedMemberId = loginedMember.getId();

		String authCode = (String) param.get("authCode");

		if (memberService.isValidModifyPrivateAuthCode(loginedMemberId, authCode) == false) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", String.format("비밀번호를 다시 체크해주세요"));
			return "common/redirect";
		}

		// 비번 수정
		memberService.doModifyPrivate(loginedMemberId, loginPw);
		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("비밀번호가 수정되었습니다."));

		return "common/redirect";
	}

	@RequestMapping("/member/findLoginId")
	public String findLoginId() {
		return "member/findLoginId";
	}

	@RequestMapping("/member/doFindLoginId")
	public String doFindLoginId(String nickname, String name, Model model, String redirectUri) {

		Member member = memberService.doFindLoginId(nickname, name);

		// 틀리면 !

		if (member == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", String.format("응 돌아가"));
			return "common/redirect";
		}

		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("이메일은 %s입니다", member.getEmail()));

		return "common/redirect";
	}

	@RequestMapping("/member/findLoginPw")
	public String findLoginPw() {
		return "member/findLoginPw";
	}

	@RequestMapping("/member/doFindLoginPw")
	public String doFindLoginPw(Model model, String redirectUri, String email) {

		Member member = memberService.getMemberByEmailForFindLoginPw(email);

		if (member == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", String.format("회원가입 이력이 없는 이메일 입니다."));
			return "common/redirect";
		}

		// 임시패스워드 코드
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String tempPw = temp.toString();

		// 비밀번호 암호화 시키기
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}
		md.update(tempPw.getBytes());
		String loginPw = String.format("%064x", new BigInteger(1, md.digest()));

		// 임시패스워드 발송 !
		memberService.sendUpdateTempLoginPw(tempPw, email);
		// 임시패스워드를 암호화 시켜 비밀번호로 업데이트.
		memberService.doUpdateTempLoginPw(loginPw, email);
		// 임시패스워드 업데이트시 useTempPw value 값 1로 변경
		memberService.setValue(member);

		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("%s로 임시패스워드가 발송되었습니다.", email));

		return "common/redirect";
	}
	
	@RequestMapping("/member/registory")
	@ResponseBody
	public Map<String, Object> showRegistory(String searchKeyword) {
		
		List<Member> members = memberService.getMemberBySearch(searchKeyword);
		
		Map<String, Object> rs = new HashMap<>();
		
		for ( Member member : members ) {
			rs.put("pagination",false);
			rs.put("results",member);
			rs.put("total_count",members.size());
		}
		
		return rs;
	} 
	
	
	// 다른 회원 화면 보여주기

	@RequestMapping("/member/showOther")
	public String showOther(@RequestParam Map<String, Object> param, Model model, int id, HttpServletRequest req) {
		
		Member member = memberService.getMemberById(id);
		
		int memberId = member.getId();
		int loginedMemberId = (int) req.getAttribute("loginedMemberId");
		
		System.out.println("확인 : " + member.getId());
		
		// 로그인 한 본인이 팔로우 중.
		int following = memberService.getFollowingConfirm(memberId, loginedMemberId);
		
		// 상대방이 날 팔로우 한걸 확인
		int followCross = memberService.getFollowCross(memberId,loginedMemberId);
				
		// 회원이 쓴 게시글 카운트
		int articleCount = articleService.getArticleCount(memberId);
		// 회원 팔로우 카운트
		int followCount = memberService.getFollowCount(memberId);
		// 회원 팔로워 카운트
		int followerCount = memberService.getFollowerCount(memberId);
		// 맞팔 확인

		// 회원이 쓴 게시글
		List<Article> articles = articleService.getForPrintArticles2(memberId);

		// File userAvatarImg = memberService.getUserAvatarImg(memberId);

		List<File> files = fileService.getFiles("member", memberId, "common", "attachment");
		if (files.size() > 0) {
			File file = files.get(0);

			if (member.getExtra() == null) {
				member.setExtra(new HashMap<>());
			}

			member.getExtra().put("writerAvatarImgUrl",
					"/file/showImg?id=" + file.getId() + "&updateDate=" + file.getUpdateDate());
		} else {
			member.getExtra().put("writerAvatarImgUrl", "/resource/img/avatar_no.jpg");
		}

		Map<String, File> filesMap = new HashMap<>();

		for (File file : files) {
			filesMap.put(file.getFileNo() + "", file);
		}

		boolean usePrivateAccount = memberService.usePrivateAccount(memberId);
		model.addAttribute("usePrivateAccount",usePrivateAccount);
		model.addAttribute("following", following);
		model.addAttribute("followerCount", followerCount);
		model.addAttribute("followCount", followCount);
		model.addAttribute("articleCount", articleCount);
		model.addAttribute("followCross",followCross);
		model.addAttribute("member", member);
		model.addAttribute("articles", articles);
		return "member/showOther";
	}

	@RequestMapping("/member/doActionFollow")
	public Map<String, Object> doActionFollow(HttpServletRequest req, int followId, int followerId) {
		
		Map<String, Object> rs = new HashMap<>();
	
		Map<String,Object> followRs = memberService.doActionFollow(followId, followerId);
		
		
		String resultCode = (String) followRs.get("resultCode");
		rs.put("resultCode",resultCode);
		
		return rs;
	}

	@RequestMapping("/member/doDeleteFollow")
	public String doDeleteFollow(int followId, int followerId, String redirectUri, Model model) {

		redirectUri = "..home/main";
		memberService.doDeleteFollow(followId, followerId);
		model.addAttribute("redirectUri", redirectUri);

		return "common/redirect";
	}

	@RequestMapping("/member/readAct")
	@ResponseBody
	public void readAct(Model model, HttpServletRequest request) {

		int loginedMemberId = (int) request.getAttribute("loginedMemberId");

		memberService.updateActReadStatus(loginedMemberId);
		memberService.updateActReadStatusInReply(loginedMemberId);
		memberService.updateActReadStatusInFollow(loginedMemberId);
	}

	@RequestMapping("/member/usePrivateMode")
	@ResponseBody
	public void usePrivateMode(Model model,int id) {
		memberService.setValueForPrivateMode(id);
	}
	
	@RequestMapping("/member/disAblePrivateMode")
	@ResponseBody
	public void disAblePrivateMode(int id) {
		memberService.disAblePrivateMode(id);
	}
	
	@RequestMapping("/member/blockWhoClickUsers")
	@ResponseBody
	public void blockWhoClickUsers(int id,HttpServletRequest request) {
		int loginedMemberId = (int) request.getAttribute("loginedMemberId");
		//memberService.blockWhoClickUsers(id,loginedMemberId);
	}
	
	@RequestMapping("/member/mystatistics")
	public String showMystatistics(@RequestParam Map<String, Object> param, Model model, int id, HttpServletRequest req) {
		
			Member member = memberService.getMemberById(id);
			
			int memberId = member.getId();
			int loginedMemberId = (int) req.getAttribute("loginedMemberId");
			
			// 이전 게시글로 인한 팔로우 증가 숫자
			int beforeFollowCount = memberService.getBeforeFollowCount(memberId);
			
			// 총 댓글 받은 숫자
			int totalReplyCount = memberService.getTotalReplyCount(memberId);
			// 총 좋아요 숫자
			int totalLikeCount = memberService.getTotalLikeCount(memberId);
			//	하루 게시글
			int articleCountBeforeDay = memberService.getArticleCountBeforeDay(memberId);
			// 일주일 게시글
			int articleCountBeforeWeek = memberService.getArticleCountBeforeWeek(memberId);
			// 한달 게시글
			int articleCountBeforeMonth = memberService.getArticleCountBeforeMonth(memberId);
			
			// 팔로우 확인
			

			// 나의 최고로 많이받은 좋아요 숫자 + article
			List<Article> articles = articleService.getForPrintArticleByLikeKing(memberId);
			
	
			for ( Article article : articles ) {
				List<File> files = fileService.getFiles("article", article.getId(), "common", "attachment");
				Map<String, File> filesMap = new HashMap<>();

				for (File file : files) {
					filesMap.put(file.getFileNo() + "", file);
				}
				Util.putExtraVal(article, "file__common__attachment", filesMap);
			}
			
			for ( Article article : articles ) {	
				int articleId = article.getId();
				ArticleLike articleLike = memberService.getArticleKingLikeCount(articleId);
				
				model.addAttribute("articleLike",articleLike);
			}
			
			// 가장 오래된 팔로우들
			List<Friend> friends = memberService.getMemberByOldFriend(memberId);
			
			for ( Friend oldFriend : friends) {
				
				// 로그인 한 본인이 팔로우 중.
				
				int following = memberService.getFollowingConfirm(oldFriend.getFollowerId(), loginedMemberId);
				
				System.out.println("확인좀하자 : " + oldFriend.getFollowerId());
				
				// 상대방이 날 팔로우 한걸 확인
				int followCross = memberService.getFollowCross(oldFriend.getFollowerId(),loginedMemberId);
				
				System.out.println("확인좀하자2 : " + oldFriend.getFollowId());
				
				model.addAttribute("following",following);
				model.addAttribute("followCross",followCross);

				
				System.out.println("확인 좀 : " + oldFriend.getId() + oldFriend.getRegDate() );
				
				List<File> files = fileService.getFiles("member",oldFriend.getFollowerId(), "common", "attachment");
				
				if (files.size() > 0) {
					File file = files.get(0);

					if (oldFriend.getExtra() == null) {
						oldFriend.setExtra(new HashMap<>());
					}

					oldFriend.getExtra().put("writerAvatarImgUrl",
							"/file/showImg?id=" + file.getId() + "&updateDate=" + file.getUpdateDate());
				} else {
					oldFriend.getExtra().put("writerAvatarImgUrl", "/resource/img/avatar_no.jpg");
				}

				Map<String, File> filesMap = new HashMap<>();

				for (File file : files) {
					filesMap.put(file.getFileNo() + "", file);
				}

			}
			
			model.addAttribute("articleCountBeforeMonth",articleCountBeforeMonth);
			model.addAttribute("articleCountBeforeWeek",articleCountBeforeWeek);
			model.addAttribute("articleCountBeforeDay",articleCountBeforeDay);
			model.addAttribute("totalReplyCount",totalReplyCount);
			model.addAttribute("totalLikeCount",totalLikeCount);
			model.addAttribute("beforeFollowCount",beforeFollowCount);
			model.addAttribute("member", member);
			model.addAttribute("friends",friends);
			model.addAttribute("articles", articles);
		return "member/mystatistics";
	}
	
	@RequestMapping("/member/showDisAbledForm")
	public String showDisAbledForm() {
		return "member/showDisAbledForm";
	}
	
	@RequestMapping("/member/disAbledAccount")
	public String disAbledAccount(int id,HttpServletRequest req,String loginPwReal,Model model) {
		
		String loginPw = loginPwReal;
		
		Member member = memberService.getMemberById(id);
		
		
		int loginedMemberId = (int) req.getAttribute("loginedMemberId");
		
		if (member.getLoginPw().equals(loginPw) == false) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			return "common/redirect";
		}
		
		
		
		
		return "common/redirect";
		
	}
	
	
	@RequestMapping("/member/changeProfile")
	@ResponseBody
	public void changeProfile(@RequestParam Map<String, Object> param, HttpServletRequest request) {

		Map<String, Object> newParam = Util.getNewMapOf(param, "fileIdsStr", "id");

		int loginedMemberId = (int) request.getAttribute("loginedMemberId");
	}
}
