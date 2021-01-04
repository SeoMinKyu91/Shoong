package com.kosmo.shoong.service.impl.gallery;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.gallery.GalleryDTO;
import com.kosmo.shoong.service.gallery.GalleryService;

@Service("galleryService")
public class GalleryServiceImpl implements GalleryService{
	
	@Resource(name="galleryDAO")
	private GalleryDAO galleryDAO;

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
		// TODO Auto-generated method stub
		return galleryDAO.imgSelectList(map);
	}

	@Override
	public List<Map> imgFirstList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}


	
}
