package com.kosmo.shoong.service.mypage;

import java.util.List;
import java.util.Map;

public interface MyPageDiaryService {

	
	List<Map> recordSelectList(Map map);
	Map recordSelectOne(Map map);
	List<Map> selectList(Map map);
	Map selectOne(Map map);
	int insert(Map map);
	int delete(Map map);
	int update(Map map);

	int imgInsert(Map map);
	Map imgSelect(Map map);
	List<Map> imgSelectList(Map map);
	int imgUpdate(Map map);
	
}
