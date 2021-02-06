package com.kosmo.shoong.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.shoong.service.chat.ChatBotService;
import com.kosmo.shoong.service.mypage.MyPageRecordService;

@Controller
@RequestMapping("/chatbot/")
public class ChatBotController {
	
	@Resource(name="chatBotService")
	private ChatBotService service;
	
	@RequestMapping(value = "map", method = RequestMethod.GET)
	public String moveMap(Model model,HttpServletRequest req) {
		String id =  req.getSession().getAttribute("userId").toString();
		String location =service.userAddrSelect(id);
		String word = String.format("%s %s", location,"자전거 가게");
		model.addAttribute("word",word);
		model.addAttribute("location",location);
		return "chatbot/SearchMap";
	}
	
}
