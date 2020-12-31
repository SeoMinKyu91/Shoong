package com.kosmo.shoong.service.pack;

import java.util.List;
import java.util.Map;

public interface PackGalleryService {

	int insert(Map map);
	int delete(Map map);
	List<PackGalleryDTO> selectList(Map map);
}
