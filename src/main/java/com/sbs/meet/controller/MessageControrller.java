package com.sbs.meet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbs.meet.dto.File;
import com.sbs.meet.dto.Message;
import com.sbs.meet.dto.ResultData;
import com.sbs.meet.service.FileService;
import com.sbs.meet.service.MessageService;

@Controller
public class MessageControrller {
	@Autowired
	private MessageService messageService;
	@Autowired
	private FileService fileService;

	@RequestMapping("/message/list")
	public String showList(HttpSession session) { 
		
		int loginedMemberId;
		loginedMemberId = (int) session.getAttribute("loginedMemberId");
		
		messageService.doUpdateReadStatus(loginedMemberId);
		
		return "message/list";
	}
	
	@RequestMapping("/message/getMsgNoticeCount")
	@ResponseBody
	public ResultData getMsgNoticeCount(HttpSession session,Model model) {
		
		int loginedMemberId;
		loginedMemberId = (int) session.getAttribute("loginedMemberId");
		
		int msgNoticeCount = messageService.getMsgNoticeCount(loginedMemberId);
		
		Map<String, Object> rsDataBody = new HashMap<>();
		
		rsDataBody.put("msgNoticeCount", msgNoticeCount);
		model.addAttribute("msgNoticeCount",msgNoticeCount);
		
		return new ResultData("S-1", String.format("%s개의 메세지를 불러왔습니다.", msgNoticeCount), rsDataBody);
	}

	@RequestMapping("/message/doWriteMessageAjax")
	@ResponseBody
	public String doWriteReplyAjax(@RequestParam Map<String, Object> param, String redirectUri, Model model) {
		Map<String, Object> rsDataBody = new HashMap<>();

		redirectUri = (String) param.get("redirectUri");
		model.addAttribute("redirectUri", redirectUri);

		messageService.writeMessage(param);

		return "common/redirect";
	}

	@RequestMapping("/message/getForPrintMessagesAjax")
	@ResponseBody
	public ResultData getForPrintRepliesAjax(@RequestParam Map<String, Object> param,Model model) {

		List<Message> messages = messageService.getForPrintMessagesAjax(param);
		
		// 상대방이 보낸거 이미지 뜨게하기
		
		for (Message message : messages) {
			List<File> files = fileService.getFiles("member", message.getFromId(), "common", "attachment");
			if (files.size() > 0) {
				File file = files.get(0);

				if (message.getExtra() == null) {
					message.setExtra(new HashMap<>());
				}

				message.getExtra().put("writerAvatarImgUrl",
						"/file/showImg?id=" + file.getId() + "&updateDate=" + file.getUpdateDate());

			} else {
				message.getExtra().put("writerAvatarImgUrl", "/resource/img/avatar_no.jpg");
			}

			Map<String, File> filesMap = new HashMap<>();

			for (File file : files) {
				filesMap.put(file.getFileNo() + "", file);
			}

		}
	
		// 내가보낸거 이미지 뜨게하기 
		
//		for (Message message : messages) {
//			List<File> files = fileService.getFiles("member", message.getToId(), "common", "attachment");
//			if (files.size() > 0) {
//				File file = files.get(0);
//
//				if (message.getExtra() == null) {
//					message.setExtra(new HashMap<>());
//				}
//
//				message.getExtra().put("writerAvatarImgUrlByUser",
//						"/file/showImg?id=" + file.getId() + "&updateDate=" + file.getUpdateDate());
//
//			} else {
//				message.getExtra().put("writerAvatarImgUrl", "/resource/img/avatar_no.jpg");
//			}
//
//			Map<String, File> filesMap = new HashMap<>();
//
//			for (File file : files) {
//				filesMap.put(file.getFileNo() + "", file);
//			}
//		}

		Map<String, Object> rsDataBody = new HashMap<>();
		rsDataBody.put("messages", messages);
		
		return new ResultData("S-1", String.format("%s개의 메세지를 불러왔습니다.", messages.size()), rsDataBody);

	}
	
	@RequestMapping("/message/getForPrintMessageDetailAjax")
	@ResponseBody
	public ResultData getForPrintMessageDetailAjax(@RequestParam Map<String, Object> param,Model model) {

		List<Message> messages = messageService.getForPrintMessagesAjax(param);
		// 걔가 보낸거 떠야함
		// 내가 보낸것도 떠야함
		// 상대방이 보낸거 이미지 뜨게하기
		
		for (Message message : messages) {
			List<File> files = fileService.getFiles("member", message.getFromId(), "common", "attachment");
			if (files.size() > 0) {
				File file = files.get(0);

				if (message.getExtra() == null) {
					message.setExtra(new HashMap<>());
				}

				message.getExtra().put("writerAvatarImgUrl",
						"/file/showImg?id=" + file.getId() + "&updateDate=" + file.getUpdateDate());

			} else {
				message.getExtra().put("writerAvatarImgUrl", "/resource/img/avatar_no.jpg");
			}

			Map<String, File> filesMap = new HashMap<>();

			for (File file : files) {
				filesMap.put(file.getFileNo() + "", file);
			}

		}
		Map<String, Object> rsDataBody = new HashMap<>();
		rsDataBody.put("messages", messages);
		
		return new ResultData("S-1", String.format("%s개의 메세지를 불러왔습니다.", messages.size()), rsDataBody);

	}
	
	
	
	

}
