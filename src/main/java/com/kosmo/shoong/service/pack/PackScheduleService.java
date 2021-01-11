package com.kosmo.shoong.service.pack;

import java.util.List;
import java.util.Map;

public interface PackScheduleService {
	//팩 일정 CURD
	List<Map> scheduleSelectList(Map map);
	int scheduleUpdate(Map map);
	int scheduleDelete(Map map);
	int scheduleInsert(Map map);
	
	//글쓴이 확인
	boolean isWriter(Map map);
	
	//다른사람이(글쓴이가 아닌) 팩 일정 참가
	int scheduleJoin(Map map);
	int scheduleJoinCancle(Map map);
	
	//글쓴이가 다른사람 참가 수락 거절
	int scheduleJoinOk(Map map);
	int scheduleJoinNo(Map map);
	
	
	
	
}///////////////
