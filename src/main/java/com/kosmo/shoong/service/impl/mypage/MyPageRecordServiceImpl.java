package com.kosmo.shoong.service.impl.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.mypage.MyPageRecordService;

@Service("myPageRecordService")
public class MyPageRecordServiceImpl implements MyPageRecordService {

	@Resource(name="myPageRecordDAO")
	private MyPageRecordDAO dao;
	
	@Override
	public List<Map> selectList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList(map);
	}

	@Override
	public Map selectOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOne(map);
	}

}
