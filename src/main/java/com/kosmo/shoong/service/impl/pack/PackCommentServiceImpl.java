package com.kosmo.shoong.service.impl.pack;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.pack.PackCommentDTO;
import com.kosmo.shoong.service.pack.PackCommentService;

@Service("packCommentService")
public class PackCommentServiceImpl implements PackCommentService {

	@Resource(name="packCommentDAO")
	private PackCommentDAO dao;

	@Override
	public int packCommentWrite(Map map) {
		return dao.packCommentWrite(map);
	}/////////

	@Override
	public int packCommentDelte(Map map) {
		return dao.packCommentDelte(map);
	}

	@Override
	public int packCommentUpdate(Map map) {
		return dao.packCommentUpdate(map);
	}

	@Override
	public int packCommentImgWrite(Map map) {
		// TODO Auto-generated method stub
		return dao.packCommentImgWrite(map);
	}

	@Override
	public List<PackCommentDTO> packCommentMainSelectList(Map map) {
		return dao.packCommentMainSelectList(map);
	}

	public List<PackCommentDTO> myCommentList(Map map) {

		return dao.myCommentList(map);
	}

	public Map packCommentSelectOne(Map map) {
		
		return dao.packCommentSelectOne(map);
	}

	public PackCommentDTO packCommentView(Map map) {
		return dao.packCommentView(map);
	}

	public int packCommentImgDelete(Map map) {

		return dao.packCommentImgDelete(map);
	}

	public int packCommentImgUpdate(Map map) {
		
		return dao.packCommentImgUpdate(map);
	}


}
