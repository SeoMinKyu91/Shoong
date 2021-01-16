package com.kosmo.shoong.service.pack;

import java.util.List;
import java.util.Map;

public interface PackService {

	List<PackDTO> selectList(Map map);
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	
	
	//팩 생성시 pack_create 와 pack_join, pack_manager생성용. 
	int insertCreate(Map map);
	int insertJoin(Map map);
	int insertManager(Map map);
	
	//팩 이름 체크
	int selectPackName(Map map);
}
