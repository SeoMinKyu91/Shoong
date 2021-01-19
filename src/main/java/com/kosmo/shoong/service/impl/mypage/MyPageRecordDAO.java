package com.kosmo.shoong.service.impl.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.mypage.MyPageRecordService;
@Repository("myPageRecordDAO")
public class MyPageRecordDAO implements MyPageRecordService{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public List<Map> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("mypageRecordSelectList",map);
	}

	@Override
	public Map selectOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("mypageRecordSelectOne",map);
	}

}
