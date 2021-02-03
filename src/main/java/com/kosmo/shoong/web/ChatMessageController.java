package com.kosmo.shoong.web;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.shoong.service.impl.chat.ChatMessageServiceImpl;

@RequestMapping("/chat/")
@Controller
public class ChatMessageController {
	
	@Resource(name = "chatMessageImpl")
	private ChatMessageServiceImpl service;
	
	//채팅창 관련 작업
	@RequestMapping(value="listAll.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String chatListAll(@RequestParam Map map,Model model) {
		System.out.println("채팅창 리스트 요청");
		System.out.println(map.get("userId"));
		System.out.println(map.get("packId"));
		
		System.out.println("db에서 가져온 데이터");
		List<Map> packMembers = service.packMemberSelectList(map);
		for(Map packMember : packMembers) {
			System.out.println(packMember.get("NAME"));
			
		}
		
		List<Map> chatList = service.chatSelectList(map);
		for(Map chat : chatList) {
			System.out.println("-----------------------------------------");
			System.out.println("룸 번호:"+chat.get("CHAT_ROOM_NO"));
			System.out.println("룸 이름:"+chat.get("CHAT_ROOM_TITLE"));
			System.out.println("최근 글:"+chat.get("chatMessageContent"));
			System.out.println("룸 접속 맴버들");
			List<Map> qwe = (List<Map>) chat.get("chatRoomJoinMember");
			for(Map asd: qwe) {
				System.out.println("접속 이름:"+asd.get("NAME"));
				System.out.println("접속 번호:"+asd.get("CHAT_ROOM_JOIN_NO"));
				System.out.println("유저 아이디:"+asd.get("USER_ID"));
			}
			
			
			
		}
		
		JSONArray jsonArray = new JSONArray();
		jsonArray.add(packMembers);
		jsonArray.add(chatList);
		
		
		return jsonArray.toJSONString();
	}
	
	@RequestMapping(value="message/selectOne.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String messageSelectOne(@RequestParam Map map,Model model) {
		
		System.out.println("messageSelectOne들어옴");
		System.out.println("view에서 넘어온 채팅방 번호"+map.get("chatRoomNo"));
		List<Map> lists = service.chatMessageSelectOne(map);
		for(Map list : lists) {
			
			java.util.Date  chatDate = (java.util.Date) list.get("CHAT_MESSAGE_DATE");
			SimpleDateFormat sdf = new SimpleDateFormat("a h:mm",Locale.KOREAN);
			list.put("CHAT_MESSAGE_DATE", sdf.format(chatDate).toString()); 
			System.out.println(list.get("CHAT_MESSAGE_DATE"));
			
		}
		JSONArray json = new JSONArray();
		json.add(lists);
		
		
		return json.toJSONString();
	}
	
	@RequestMapping(value="message/insert.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String chatMessageInsert(@RequestParam Map map) {
		int result = service.chatMessageInsert(map);
		if(result == 1) {
			return "디비입력성공";
		}
		else {
			return "디비입력실패";
		}
		
		
	}
	
}
