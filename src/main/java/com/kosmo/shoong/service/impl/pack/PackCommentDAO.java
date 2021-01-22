package com.kosmo.shoong.service.impl.pack;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.pack.PackCommentDTO;
import com.kosmo.shoong.service.pack.PackCommentReplyDTO;
import com.kosmo.shoong.service.pack.PackCommentService;

@Repository
public class PackCommentDAO implements PackCommentService {
	
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public int packCommentWrite(Map map) {
		return sqlMapper.insert("packCommentWrite",map);
	}////////////

	@Override
	public int packCommentDelte(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int packCommentUpdate(Map map) {
		return sqlMapper.update("packCommentUpdate",map);
	}

	@Override
	public int packCommentImgWrite(Map map) {
		return sqlMapper.insert("packCommentImgWrite",map);
	}//////////

	@Override
	public List<PackCommentDTO> packCommentMainSelectList(Map map) {
		
		List<PackCommentDTO> list = sqlMapper.selectList("packCommentSelectList",map);
		for(PackCommentDTO dto : list) {
			String packCommentNo = dto.getPackCommentNo();
			List<String> packCommentImg = sqlMapper.selectList("packCommentImageList",packCommentNo);
			if(packCommentImg != null) {
				dto.setPackCommentImages(packCommentImg);
			}
			List<PackCommentReplyDTO> packCommentReply = sqlMapper.selectList("packCommentReplyList",packCommentNo);
			if(packCommentReply != null) {
				dto.setPackCommentReply(packCommentReply);
			}
			
			
		}
		
		
		
		return list;
	}

	public List<PackCommentDTO> myCommentList(Map map) {
		List<PackCommentDTO> list = sqlMapper.selectList("myCommentList",map);
		for(PackCommentDTO dto : list) {
			String packCommentNo = dto.getPackCommentNo();
			List<String> packCommentImg = sqlMapper.selectList("packCommentImageList",packCommentNo);
			if(packCommentImg != null) {
				dto.setPackCommentImages(packCommentImg);
			}
			List<PackCommentReplyDTO> packCommentReply = sqlMapper.selectList("packCommentReplyList",packCommentNo);
			if(packCommentReply != null) {
				dto.setPackCommentReply(packCommentReply);
			}
			
		}
		
		return list;
	}

	public Map packCommentSelectOne(Map map) {
		Map commentOne = sqlMapper.selectOne("packCommentSelectOne",map);
		List<String> commentImgs = sqlMapper.selectList("packCommentImageList",map);
		if(commentImgs !=null) {
			commentOne.put("packCommentImgs", commentImgs);
		}
		return commentOne;
		
	}
	
	
}
