package com.kosmo.shoong.service.pack;

import java.util.List;
import java.util.Map;

public interface PackCommentService {
	
	
	
	int packCommentWrite(Map map);
	int packCommentDelte(Map map);
	int packCommentUpdate(Map map);
	int packCommentImgWrite(Map map);
	
	List<PackCommentDTO> packCommentMainSelectList(Map map);
	
}
