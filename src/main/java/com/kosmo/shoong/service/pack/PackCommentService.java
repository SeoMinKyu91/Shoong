package com.kosmo.shoong.service.pack;

import java.util.List;
import java.util.Map;

public interface PackCommentService {
	
	boolean isLogin(Map map);
	List<PackCommentDTO> selectList(Map map);
	//상세보기용
	PackCommentDTO selectOne(Map map);
	//입력,수정,삭제
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	
}
