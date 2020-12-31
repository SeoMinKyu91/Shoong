package com.kosmo.shoong.service.pack;

import java.util.List;
import java.util.Map;


public interface PackNoticeService {
	//관리자 확인용
	boolean isManager(Map map);
	
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	
	List<PackNoticeDTO> selectList(Map map);
	PackNoticeDTO selectOne(Map map);
	
}///////////////////interface
