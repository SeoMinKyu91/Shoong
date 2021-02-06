package com.kosmo.shoong.service.impl.chat;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.chat.ChatBotService;

@Repository("chatBotDAO")
public class ChatBotDAO implements ChatBotService{

	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public String userAddrSelect(String id) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("userAddrSelect",id);
	}

}
