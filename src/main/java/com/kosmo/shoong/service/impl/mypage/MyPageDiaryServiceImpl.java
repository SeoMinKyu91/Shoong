package com.kosmo.shoong.service.impl.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.mypage.MyPageDiaryService;

@Service("myPageDiaryService")
public class MyPageDiaryServiceImpl implements MyPageDiaryService{

	@Resource(name="myPageDiaryDAO")
	private MyPageDiaryDAO dao;
	
	@Override
	public List<Map> recordSelectList(Map map) {
		// TODO Auto-generated method stub
		return dao.recordSelectList(map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return dao.insert(map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return dao.delete(map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return dao.update(map);
	}

	@Override
	public List<Map> selectList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList(map);
	}

	@Override
	public int imgInsert(Map map) {
		// TODO Auto-generated method stub
		return dao.imgInsert(map);
	}

	@Override
	public Map imgSelect(Map map) {
		// TODO Auto-generated method stub
		return dao.imgSelect(map);
	}

	@Override
	public int imgUpdate(Map map) {
		// TODO Auto-generated method stub
		return dao.imgUpdate(map);
	}

	@Override
	public Map selectOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOne(map);
	}

	@Override
	public List<Map> imgSelectList(Map map) {
		// TODO Auto-generated method stub
		return dao.imgSelectList(map);
	}

}
