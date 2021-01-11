package com.kosmo.shoong.service.impl.gallery;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.gallery.GalleryDTO;
import com.kosmo.shoong.service.gallery.GalleryService;

@Repository
public class GalleryDAO implements GalleryService{
	
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map> imgSelectList(Map map) {
		return sqlMapper.selectList("showImg",map);
	}

	@Override
	public List<Map> imgFirstList(Map map) {
		
		return sqlMapper.selectList("imgFirst",map);
	}


}
