package com.kosmo.shoong.service.impl.chat;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.chat.ChatMessageService;

@Service("chatMessageImpl")
public class ChatMessageServiceImpl implements ChatMessageService{

	@Resource(name ="chatMessageDAO")
	private ChatMessageDAO dao;
	@Override
	public List<Map> packMemberSelectList(Map map) {

		return dao.packMemberSelectList(map);
	}

	@Override
	public List<Map> chatSelectList(Map map) {
		return dao.chatSelectList(map);
	}

	@Override
	public List<Map> chatSelectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int chatMessageInsert(Map map) {
		return dao.chatMessageInsert(map);
		
	}

	@Override
	public int chatMessageDelete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int chatRoomInsert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int chatRoomTitleUpdate(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int chatRoomJoinInsert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int chatRoomJoinDelete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Map> chatMessageSelectOne(Map map) {
		
		return dao.chatMessageSelectOne(map);
	}

}
