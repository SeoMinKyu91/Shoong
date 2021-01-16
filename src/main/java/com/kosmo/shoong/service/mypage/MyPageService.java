package com.kosmo.shoong.service.mypage;

import java.util.List;
import java.util.Map;


public interface MyPageService {


	List<Map> selectList(Map map);
	List<Map> diaryselectList(Map map);
	List<Map> chartRecordselectList(Map map);
	int insert(Map map);
	int delete(Map map);
	int update(Map map);

	
	
}
