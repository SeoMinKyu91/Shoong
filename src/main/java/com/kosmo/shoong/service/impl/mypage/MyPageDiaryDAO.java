package com.kosmo.shoong.service.impl.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.mypage.MyPageDiaryService;

@Repository("myPageDiaryDAO")
public class MyPageDiaryDAO implements MyPageDiaryService{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public List<Map> recordSelectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("DiaryRecordSelectList",map);
	}
	
	@Override
	public List<Map> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("DiarySelectList",map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("DiaryInsert",map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("DiaryDelete",map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("DiaryUpdate",map);
	}

	@Override
	public int imgInsert(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("DiaryImgInsert",map);
	}

	@Override
	public Map imgSelect(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("DiaryImgSelectOne",map);
	}

	@Override
	public int imgUpdate(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("DiaryImgUpdate",map);
	}

	@Override
	public Map selectOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("DiarySelectOne",map);
	}

	@Override
	public List<Map> imgSelectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("DiaryImgSelectList",map);
	}



}
