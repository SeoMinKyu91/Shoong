package com.kosmo.shoong.service.impl.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.mypage.MyPageService;

@Repository("myPageDAO")
public class MyPageDAO implements MyPageService {

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public List<Map> selectList(Map map) {
		// TODO Auto-generated method stub
		return null;
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
		return sqlMapper.update("mypageUpdate",map); 
	}

	@Override
	public List<Map> diaryselectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("mainDiarySelectList",map);
	}

	@Override
	public List<Map> chartRecordselectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("chartRecordselectList", map);
	}

}
