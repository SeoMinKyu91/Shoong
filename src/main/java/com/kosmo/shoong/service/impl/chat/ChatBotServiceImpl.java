package com.kosmo.shoong.service.impl.chat;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.chat.ChatBotService;

@Service("chatBotService")
public class ChatBotServiceImpl implements ChatBotService{

	
	@Resource(name ="chatBotDAO")
	private ChatBotDAO dao;
	
	@Override
	public String userAddrSelect(String id) {
		// TODO Auto-generated method stub
		return dao.userAddrSelect(id);
	}

	@Override
	public List getRecordList(String id) {
		// TODO Auto-generated method stub
		return dao.getRecordList(id);
	}

}
