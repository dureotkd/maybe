package com.sbs.meet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String showList() { 
		return "message/list";
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
	public ResultData getForPrintRepliesAjax(@RequestParam Map<String, Object> param) {

		List<Message> messages = messageService.getForPrintMessagesAjax(param);

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
