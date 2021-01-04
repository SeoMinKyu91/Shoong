package com.kosmo.shoong.service.impl.pack;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.pack.PackCommentDTO;
import com.kosmo.shoong.service.pack.PackCommentService;

@Service("packCommentService")
public class PackCommentServiceImpl implements PackCommentService {
	
	@Resource(name="PackCommentDAO")
	private PackCommentDAO dao;
	
	@Override
	public boolean isLogin(Map map) {
		return dao.isLogin(map);
	}
	
	@Override
	public List<PackCommentDTO> selectList(Map map){
		return dao.selectList(map);
	}
	
	@Override
	public PackCommentDTO selectOne(Map map) {
		return dao.selectOne(map);
	}
	
	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}
	
	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}
	
	@Override
	public int update(Map map) {
		return dao.update(map);
	}
}
