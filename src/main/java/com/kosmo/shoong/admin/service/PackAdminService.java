package com.kosmo.shoong.admin.service;

import java.util.List;
import java.util.Map;


public interface PackAdminService {
	
	List<PackAdminDTO> selectList(Map map);
		int deletePack(Map map);
		
}
