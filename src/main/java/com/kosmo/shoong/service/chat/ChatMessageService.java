package com.kosmo.shoong.service.chat;

import java.util.List;
import java.util.Map;

public interface ChatMessageService {
	List<Map> packMemberSelectList(Map map);
	List<Map> chatSelectList(Map map);
	List<Map> chatSelectOne(Map map);
	
	int chatMessageInsert(Map map);
	int chatMessageDelete(Map map);
	
	int chatRoomInsert(Map map);
	int chatRoomTitleUpdate(Map map);
	
	int chatRoomJoinInsert(Map map);
	int chatRoomJoinDelete(Map map);
	
}
