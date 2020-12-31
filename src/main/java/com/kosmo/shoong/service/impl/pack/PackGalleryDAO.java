package com.kosmo.shoong.service.impl.pack;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.pack.PackGalleryDTO;
import com.kosmo.shoong.service.pack.PackGalleryService;

@Repository("packGalleryDAO")
public class PackGalleryDAO implements PackGalleryService{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public List<PackGalleryDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("PackGallerySelectList",map);
	}
	
	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("PackGalleryInsert",map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("PackGalleryDelete",map);
	}
	
	

}
