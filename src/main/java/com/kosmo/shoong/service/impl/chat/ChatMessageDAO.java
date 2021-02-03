package com.kosmo.shoong.service.impl.chat;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.chat.ChatMessageService;

@Repository
public class ChatMessageDAO implements ChatMessageService{
	
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<Map> packMemberSelectList(Map map) {
		
		
		
		
		
		return sqlMapper.selectList("packMemberSelectList",map);
		
	}

	@Override
	public List<Map> chatSelectList(Map map) {
		List<Map> list = sqlMapper.selectList("chatSelectList",map);
		for(Map chat: list) {
			String chatRoomNo = String.valueOf(chat.get("CHAT_ROOM_NO"));
			chat.put("chatMessageContent", sqlMapper.selectOne("chatMessageSelectOne",chatRoomNo));
			chat.put("chatRoomJoinMember",sqlMapper.selectList("chatRoomJoinMember",chatRoomNo));
		}
		
		return list ;
	}

	@Override
	public List<Map> chatSelectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int chatMessageInsert(Map map) {
		return sqlMapper.insert("chatMessageInsert",map);
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
		List<Map> lists = sqlMapper.selectList("chatMessageSelectList",map);
		
		
		return lists;
	}

}
