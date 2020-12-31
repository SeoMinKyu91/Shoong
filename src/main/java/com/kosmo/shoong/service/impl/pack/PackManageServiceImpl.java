package com.kosmo.shoong.service.impl.pack;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("packManageService")
public class PackManageServiceImpl {
	
	@Resource(name="packManageDAO")
	private PackManageDAO dao;
	
	
	public int packJoinInsert(Map map) {
		
		return dao.packJoinInsert(map);
	}//////////

	public int packJoinDelete(Map map) {
		
		return dao.packJoinDelete(map);
	}/////////// 
	
	public List<Map> packJoinList(Map map){
		
		return dao.packJoinList(map);
	}///////////
	
	public int packJoinUpdate(Map map) {
		
		return  dao.packJoinUpdate(map);
	}//////////

	public List<Map> packMemberList(Map map) {

		return dao.packMemberList(map);
	}/////////////

	public int packManagerInsert(Map map) {
		
		return dao.packManagerInsert(map);
	}//////////

	public int packManagerDelete(Map map) {
		
		
		return dao.packManagerDelete(map);
	}////////////

	public boolean packSelectManager(Map map) {
		
		
		return dao.packSelectManager(map);
	}//////////
	
	
}///////////////class