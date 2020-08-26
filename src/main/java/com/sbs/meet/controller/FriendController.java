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
import com.sbs.meet.service.FileService;
import com.sbs.meet.service.FriendService;
import com.sbs.meet.service.ReplyService;

@Controller
public class FriendController {
	@Autowired
	private FriendService friendService;
	@Autowired
	private FileService fileService;

	@RequestMapping("/friend/doFollowAjax")
	@ResponseBody
	public void doFollowAjax(@RequestParam Map<String, Object> param, HttpServletRequest req) {
		Map<String, Object> rsDataBody = new HashMap<>();

		friendService.applyToFollow(param);
	}
}
