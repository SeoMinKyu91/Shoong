package com.kosmo.shoong.service.impl.pack;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("packManageDAO")
public class PackManageDAO {
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;	
	
	
	public int packJoinInsert(Map map) {
		
		return sqlMapper.insert("PackJoin",map);
	}/////////////

	public int packJoinDelete(Map map) {
		
		return sqlMapper.delete("PackJoinDelete",map);
	}//////////
	
	public List<Map> packJoinList(Map map){
		
		return sqlMapper.selectList("PackJoinList",map);
	}//////////
	
	public int packJoinUpdate(Map map) {
		
		return sqlMapper.update("PackJoinUpdate",map);
	}/////////

	public List<Map> packMemberList(Map map) {
		
		return sqlMapper.selectList("PackMemberList",map);
	}//////////

	public int packManagerInsert(Map map) {
		
		
		return sqlMapper.insert("packManager",map);
	}////////////

	public int packManagerDelete(Map map) {
		
		
		return sqlMapper.delete("PackManagerDelete",map);
	}/////////

	public boolean packSelectManager(Map map) {
		
		return (Integer)sqlMapper.selectOne("PackManagerSelect",map)==1?true:false;
	}///////
	
	
}////////////////class
