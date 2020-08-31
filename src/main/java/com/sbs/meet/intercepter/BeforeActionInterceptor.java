package com.sbs.meet.intercepter;

import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sbs.meet.dto.ArticleLike;
import com.sbs.meet.dto.ArticleReply;
import com.sbs.meet.dto.File;
import com.sbs.meet.dto.Friend;
import com.sbs.meet.dto.Member;
import com.sbs.meet.service.ArticleService;
import com.sbs.meet.service.FileService;
import com.sbs.meet.service.MemberService;
import com.sbs.meet.service.MessageService;
import com.sbs.meet.service.ReplyService;

@Component("beforeActionInterceptor") // 컴포넌트 이름 설정
public class BeforeActionInterceptor implements HandlerInterceptor {

	@Autowired
	private MemberService memberService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private FileService fileService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 기타 유용한 정보를 request에 담는다.
		Map<String, Object> param = new HashMap<>();

		Enumeration<String> parameterNames = request.getParameterNames();

		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();
			Object paramValue = request.getParameter(paramName);

			param.put(paramName, paramValue);
		}

		ObjectMapper mapper = new ObjectMapper();
		String paramJson = mapper.writeValueAsString(param);

		String requestUri = request.getRequestURI();
		String queryString = request.getQueryString();

		String requestUriQueryString = requestUri;
		if (queryString != null && queryString.length() > 0) {
			requestUriQueryString += "?" + queryString;
		}

		String encodedRequestUriQueryString = URLEncoder.encode(requestUriQueryString, "UTF-8");

		request.setAttribute("requestUriQueryString", requestUriQueryString);
		request.setAttribute("urlEncodedRequestUriQueryString", encodedRequestUriQueryString);
		request.setAttribute("param", param);
		request.setAttribute("paramJson", paramJson);

		boolean isAjax = requestUri.endsWith("Ajax");

		if (isAjax == false) {
			if (param.containsKey("ajax") && param.get("ajax").equals("Y")) {
				isAjax = true;
			}
		}
		
		

		request.setAttribute("isAjax", isAjax);

		// 설정 파일에 있는 정보를 request에 담는다.
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("logiendMemberId");
		
		if ( obj == null ) {
			// 로그인 된 세션이 없는 경우.
			// 만들어 논 쿠키를 꺼내온다..
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			// loginCookie의 값을 꺼내오고 -> 즉 , 저장해논 세션 Id를 꺼내온다
			if ( loginCookie != null ) {
				String sessionId = loginCookie.getValue();
				Member member = memberService.checkUseWithSessionKey(sessionId);
				System.out.println("쿠키확인" + member);
				//  그런 사용자가 있다며 세션 생성
				if ( member != null ) {
					session.setAttribute("loginedMemberId",member.getId());
				}
			}
			// 세션 Id를 checkUseWithSessionKey에 전달해 이전에 로그인한적이 있는지 체크하는 메서드 
			// 유효시간이 > now() 인 즉 아직 유효시간이 지나지 않으면서 해당 sessionId 정보를 가지고 있는 사용자 정보를 반환해준다
		}
		
		// 시작전에 모든 유저들 레벨 업데이트 !
		List<Member> members = memberService.getAllMember();
		
		for ( Member member : members ) {
			int memberId = member.getId();
			int articleCount = articleService.getArticleCount(memberId);
			
			if ( articleCount >= 5) {
				if ( member.getNickname().equals("관리자") == false ) {
					memberService.doUpdateLevel(memberId);
				}
			}
		}
		
		
		
		// 로그인 여부에 관련된 정보를 request에 담는다.
		boolean isLogined = false;
		int loginedMemberId = 0;
		Member loginedMember = null;

		if (session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
			isLogined = true;
			loginedMember = memberService.getMemberById(loginedMemberId);
		}
		
		// 댓글 카운트
		int myReplyCount = memberService.getRepliesCount(loginedMemberId);
		
		// 메시지 카운트
		int myMsgCount = memberService.getMsgNoticeCount(loginedMemberId);
		
		// 내 게시글에 내가  댓글쓴거 빼야함
		int myRepliesInMyArticle = memberService.getRepliesCountByMe(loginedMemberId);
		
		// 좋아요 카운트
		int myLikePointCount = memberService.getMyLikePoint(loginedMemberId);
		// replyCount articleId
		
		// 팔로워 카운트
		int myFollowerCount = memberService.getMyFollowerCount(loginedMemberId);
		
		// 좋아요 받은거 카운트
		// 0개 뜨는 이유 -> int article.getId()가 하나밖에 담지못한다 내가 슨글은 여러개인데
		
		//  나의 게시글 댓글 카운트 + 좋아요 카운트 + 내 게시글에 내가 댓글쓴건 카운트x
		int myActivityCount = myReplyCount + myLikePointCount + myFollowerCount;
		
		// 댓글  
		List<ArticleReply> articleReplies = replyService.getForPrintArticleRepliesByMyArticle(loginedMemberId);
		// 좋아요
		List<ArticleLike> articleLikes = articleService.getForPrintArticleLikesByMyArticle(loginedMemberId);
		// 팔로우
		List<Friend> friends = memberService.getForPrintMyFollow(loginedMemberId);
		
		for ( Friend friend : friends ) {
			System.out.println("실험" + friends);
		}
		
		for (Friend friend : friends) {
			List<File> files = fileService.getFiles("member", friend.getFollowerId(), "common", "attachment");
			if ( files.size() > 0 ) {
				File file = files.get(0);
				
				if ( friend.getExtra() == null ) {
					friend.setExtra(new HashMap<>());
				}	
				friend.getExtra().put("followSenderAvatarImgUrl", "/file/showImg?id=" + file.getId() + "&updateDate=" + file.getUpdateDate());		
			}
			else {
				friend.getExtra().put("followSenderAvatarImgUrl", "/resource/img/avatar_no.jpg");
			}
			
			Map<String, File> filesMap = new HashMap<>();

			for (File file : files) {
				filesMap.put(file.getFileNo() + "", file);
			}
		}
		
		for (ArticleReply articleReply : articleReplies) {
			List<File> files = fileService.getFiles("member", articleReply.getMemberId(), "common", "attachment");
			if ( files.size() > 0 ) {
				File file = files.get(0);
				
				if ( articleReply.getExtra() == null ) {
					articleReply.setExtra(new HashMap<>());
				}	
				articleReply.getExtra().put("replyWriterAvatarImgUrl", "/file/showImg?id=" + file.getId() + "&updateDate=" + file.getUpdateDate());		
			}
			else {
				articleReply.getExtra().put("replyWriterAvatarImgUrl", "/resource/img/avatar_no.jpg");
			}
			
			Map<String, File> filesMap = new HashMap<>();

			for (File file : files) {
				filesMap.put(file.getFileNo() + "", file);
			}
		}
		
		for (ArticleLike articleLike : articleLikes ) {
			List<File> files = fileService.getFiles("member",articleLike.getMemberId(),"common","attachment");
			if (files.size() > 0) {
				File file = files.get(0);
				
				if ( articleLike.getExtra() == null) {
					articleLike.setExtra(new HashMap<>());
				}
				articleLike.getExtra().put("likeSenderAvatarImgUrl", "/file/showImg?id=" + file.getId() + "&updateDate=" + file.getUpdateDate());
			}
			else {
				articleLike.getExtra().put("likeSenderAvatarImgUrl", "/resource/img/avatar_no.jpg");
			}
			
			Map<String, File> filesMap = new HashMap<>();
			
			for ( File file : files ) {
				filesMap.put(file.getFileNo() + "" , file);
			}
		}
		
		request.setAttribute("friends",friends);
		request.setAttribute("articleLikes",articleLikes);
		request.setAttribute("articleReplies",articleReplies);
		request.setAttribute("myActivityCount",myActivityCount);	
		request.setAttribute("myMsgCount",myMsgCount);
		request.setAttribute("loginedMemberId", loginedMemberId);
		request.setAttribute("isLogined", isLogined);
		request.setAttribute("loginedMember", loginedMember);

		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
