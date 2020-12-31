package com.kosmo.shoong.service.impl.pack;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.pack.PackGalleryDTO;
import com.kosmo.shoong.service.pack.PackGalleryService;

@Repository("packGalleryService")
public class PackGalleryServiceImpl implements PackGalleryService {

	@Resource(name="packGalleryDAO")
	private PackGalleryDAO dao;
	
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
	public List<PackGalleryDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList(map);
	}

}
