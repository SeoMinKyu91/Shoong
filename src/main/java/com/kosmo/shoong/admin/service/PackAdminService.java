package com.kosmo.shoong.admin.service;

import java.util.List;
import java.util.Map;


public interface PackAdminService {
	
    List<Map> selectList();
	int deletePack(Map map);
	
		
}
