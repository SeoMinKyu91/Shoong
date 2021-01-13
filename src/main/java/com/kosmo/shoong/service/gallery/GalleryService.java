package com.kosmo.shoong.service.gallery;

import java.util.List;
import java.util.Map;

public interface GalleryService {

	List<Map> selectList(Map map);
	
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	
	//마이페이지
	List<Map> imgFirstList(Map map);
	
	//갤러리 페이지
	List<Map> imgSelectList(Map map);
}
