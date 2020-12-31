package com.kosmo.shoong.service.impl.pack;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.pack.PackNoticeDTO;
import com.kosmo.shoong.service.pack.PackNoticeService;

@Service("packNoticeService")
public class PackNoticeServiceImpl implements PackNoticeService{
	
	@Resource(name="packNoticeDAO")
	private PackNoticeDAO dao;
	
	
	@Override
	public boolean isManager(Map map) {
		
		return dao.isManager(map);
	}///////////

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}//////////////

	@Override
	public int delete(Map map) {
		
		return dao.delete(map); 
	}//////////////

	@Override
	public int update(Map map) {

		return dao.update(map);
	}////////////

	@Override
	public List<PackNoticeDTO> selectList(Map map) {

		return dao.selectList(map);
	}//////////

	@Override
	public PackNoticeDTO selectOne(Map map) {
		
		return dao.selectOne(map);
	}/////////////

	public int getTotalRecord(Map map) {
		
		return dao.getTotalRecored(map);
	}/////////////////

	
}///////////////class
