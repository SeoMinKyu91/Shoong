package com.kosmo.shoong.service.impl.pack;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.pack.PackNoticeDTO;
import com.kosmo.shoong.service.pack.PackNoticeService;

@Repository("packNoticeDAO")
public class PackNoticeDAO implements PackNoticeService{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	
	@Override
	public boolean isManager(Map map) {
		
		return (Integer)sqlMapper.selectOne("isManager",map)==1?true:false;
	}/////////////////

	@Override
	public int insert(Map map) {
		return sqlMapper.insert("PackNoticeInsert",map);
	}//////////////////

	@Override
	public int delete(Map map) {
		
		
		return sqlMapper.delete("PackNoticeDelete",map);
	}///////////////////

	@Override
	public int update(Map map) {
		
		return sqlMapper.update("PackNoticeUpdate",map);
	}////////////////////////

	@Override
	public List<PackNoticeDTO> selectList(Map map) {
		
		
		return sqlMapper.selectList("PackNoticeSelectList",map);
	}///////////////////

	@Override
	public PackNoticeDTO selectOne(Map map) {
		return sqlMapper.selectOne("PackNoticeSelectOne", map);
	}/////////////////

	public int getTotalRecored(Map map) {
		
		return sqlMapper.selectOne("noticeGetTotalRecord",map);
	}/////////////////////
}///////////////class
