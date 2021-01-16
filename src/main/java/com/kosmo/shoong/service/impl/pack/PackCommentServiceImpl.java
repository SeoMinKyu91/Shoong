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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int packCommentUpdate(Map map) {
		// TODO Auto-generated method stub
		return 0;
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


}
