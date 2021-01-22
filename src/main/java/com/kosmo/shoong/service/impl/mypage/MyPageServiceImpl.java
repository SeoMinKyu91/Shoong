package com.kosmo.shoong.service.impl.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.impl.member.MemberDAO;
import com.kosmo.shoong.service.mypage.MyPageService;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService{

	@Resource(name="myPageDAO")
	private MyPageDAO dao;
	
	@Override
	public List<Map> selectList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList(map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map> diaryselectList(Map map) {
		// TODO Auto-generated method stub
		return dao.diaryselectList(map);
	}

	@Override
	public List<Map> chartRecordselectList(Map map) {
		// TODO Auto-generated method stub
		return dao.chartRecordselectList(map);
	}

}
