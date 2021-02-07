package com.kosmo.shoong.web;
import java.util.Map;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value = "record",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String AjaxGetRecord(HttpServletRequest req) {
		String id =  req.getSession().getAttribute("userId").toString();
		List<Map> recordList =service.getRecordList(id);
		String recordDiv ="";
		int recordSize = recordList.size();
		if(recordSize != 0) {
			
			int totalTime = 0;
			int totalLength = 0;
			for (Map recordMap : recordList) {
				float length = Float.valueOf(recordMap.get("RECORD_LENGTH").toString());
				int time = Integer.valueOf(recordMap.get("DURATION").toString());
				totalTime += time;
				totalLength +=length;
			}
			
			
			totalTime = (int)totalTime/60;
			int hour = (int)totalTime/60;
			int minute = totalTime%60;
			String date="";
			if(hour == 0) {
				date = String.format("%d분", minute);
			}else {
				date = String.format("%d시간 %d분",hour, minute);
			}
			
			recordDiv = "회원님의 이번 달기록입니다.<br><br>"
					+ "총 주행시간 : " + date+"<br>"
					+"총 주행거리 : " + String.format("%d km", totalLength)+"<br>"
					+"총 라이딩 횟수 : " + recordSize;
		}else {
			recordDiv ="회원님은 이번달에 라이딩 기록이 없어요";
		}	
		
	return recordDiv;
	}
	
	
}
