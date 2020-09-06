package com.sbs.meet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sbs.meet.dto.Article;
import com.sbs.meet.dto.File;
import com.sbs.meet.dto.Member;
import com.sbs.meet.service.ArticleService;
import com.sbs.meet.service.FileService;
import com.sbs.meet.service.MemberService;
import com.sbs.meet.service.ReplyService;
import com.sbs.meet.util.Util;

@Controller
public class HomeController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private FileService fileService;
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/home/main")
	public String showMain(Model model,HttpServletRequest request) {
		
		int loginedMemberId = (int) request.getAttribute("loginedMemberId");
		
		// 팔로우한 애들 게시글
		List<Article> articles = articleService.getForPrintArticlesInFollow(loginedMemberId);
		for ( Article article : articles ) {
			System.out.println("시발아 : " + article.getId());
		}
		// 추천 멤버들 ( follow가 된 애들 말고 다른애들 전부 )
		
		List<Member> members = memberService.getForPrintNotFollow(loginedMemberId);
		
		for ( Member member : members) {
			List<File> files = fileService.getFiles("member",member.getId(),"common","attachment");
			if (files.size() > 0) {
				File file = files.get(0);
				
				if ( member.getExtra() == null ) {
					member.setExtra(new HashMap<>());
				}
				
				member.getExtra().put("recomendAvatarImgUrl", "/file/showImg?id=" + file.getId() + "&updateDate=" + file.getUpdateDate());
			} else {
				member.getExtra().put("recomendAvatarImgUrl", "/resource/img/avatar_no.jpg");
			}
			Map<String, File> filesMap = new HashMap<>();

			for (File file : files) {
				filesMap.put(file.getFileNo() + "", file);
			}
		}
		
		
		
		
		for (Article article : articles) {
			List<File> files = fileService.getFiles("member", article.getMemberId(), "common", "attachment");
			if ( files.size() > 0 ) {
				File file = files.get(0);
				
				if ( article.getExtra() == null ) {
					article.setExtra(new HashMap<>());
				}
				
				article.getExtra().put("writerAvatarImgUrl", "/file/showImg?id=" + file.getId() + "&updateDate=" + file.getUpdateDate());				
			}
			else {
				article.getExtra().put("writerAvatarImgUrl", "/resource/img/avatar_no.jpg");
			}
			
			Map<String, File> filesMap = new HashMap<>();

			for (File file : files) {
				filesMap.put(file.getFileNo() + "", file);
			}
		}
		
		
		
		for ( Article article : articles ) {
			
			List<File> files = fileService.getFiles("article", article.getId(), "common", "attachment");

			Map<String, File> filesMap = new HashMap<>();

			for (File file : files) {
				filesMap.put(file.getFileNo() + "", file);
			}

			Util.putExtraVal(article, "file__common__attachment", filesMap);
			}
		
		
		
		model.addAttribute("members",members);
		model.addAttribute("articles",articles);
		return "home/main";
	}
	
	@RequestMapping("home/test")
	public String showTest(String nickname) {
			
		return "home/test";
	}
	
	
		
}
