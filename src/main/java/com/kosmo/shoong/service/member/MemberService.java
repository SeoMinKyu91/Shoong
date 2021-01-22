package com.kosmo.shoong.service.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	
	boolean isMember(Map map);//회원 여부 판단
	boolean isDuplicateEmail(Map map);//이메일 중복 여부 판단
//	MemberDTO selectOne(Map map);//회원정보 상세보기
	
//	List<Map> selectList(Map map);
	
	int insert(Map map);
//	int delete(Map map);
	int update(Map map);
	MemberDTO selectOne(Map map);
	
	Map memberEditView(Map map);
	
}//////interface
