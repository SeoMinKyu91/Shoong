package com.kosmo.shoong.service.impl.gallery;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.aspectj.weaver.ast.Test;
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
		List<Map> imgs1 = galleryDAO.imgFirstList(map); 
		List<Map> imgFirst = new ArrayList<Map>();
		Map thumbnailMap;
		List<String> titles = new ArrayList();

		for(int i=0;i<imgs1.size();i++) {
			
			if(!titles.contains(imgs1.get(i).get("DIARY_TITLE"))) {			
				titles.add(imgs1.get(i).get("DIARY_TITLE").toString());
		
				Map listImg = imgs1.get(i);
				Set keys = listImg.keySet();

				thumbnailMap = new HashMap();
				
				for(Object key : keys)
					thumbnailMap.put(key, listImg.get(key));
				
				imgFirst.add(thumbnailMap);		
			} //if
		} //for i
		System.out.println("끝 썸네일 리스트<맵> :"+imgFirst);
		return imgFirst;
	}
}