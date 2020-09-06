package com.sbs.meet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbs.meet.dto.ArticleReply;
import com.sbs.meet.dto.File;
import com.sbs.meet.dto.ResultData;
import com.sbs.meet.service.ArticleService;
import com.sbs.meet.service.FileService;
import com.sbs.meet.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	@Autowired
	private FileService fileService;

	@RequestMapping("/reply/doWriteReplyAjax")
	@ResponseBody
	public void doWriteReplyAjax(@RequestParam Map<String, Object> param, HttpServletRequest req) {
		Map<String, Object> rsDataBody = new HashMap<>();

		param.put("memberId", req.getAttribute("loginedMemberId"));

		replyService.writeReply(param);
		replyService.increaseReplyCount(param);
	}

	@RequestMapping("/reply/getForPrintRepliesAjax")
	@ResponseBody
	public ResultData getForPrintRepliesAjax(@RequestParam Map<String, Object> param) {

		List<ArticleReply> articleReplies = replyService.getForPrintArticleReplies(param);

		for (ArticleReply articleReply : articleReplies) {
			List<File> files = fileService.getFiles("member", articleReply.getMemberId(), "common", "attachment");
			if (files.size() > 0) {
				File file = files.get(0);

				if (articleReply.getExtra() == null) {
					articleReply.setExtra(new HashMap<>());
				}

				articleReply.getExtra().put("writerAvatarImgUrl",
						"/file/showImg?id=" + file.getId() + "&updateDate=" + file.getUpdateDate());
			} else {
				articleReply.getExtra().put("writerAvatarImgUrl", "/resource/img/avatar_no.jpg");
			}

			Map<String, File> filesMap = new HashMap<>();

			for (File file : files) {
				filesMap.put(file.getFileNo() + "", file);
			}
		}

		Map<String, Object> rsDataBody = new HashMap<>();
		rsDataBody.put("articleReplies", articleReplies);

		return new ResultData("S-1", String.format("%s개의 댓글을 불러왔습니다.", articleReplies.size()), rsDataBody);

	}
}
