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
		sqlMapper.delete("packCommentImgDelete",map);
		return sqlMapper.delete("packCommentDelete",map);
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
			map.put("packCommentNo", packCommentNo);
			List<String> packCommentImg = sqlMapper.selectList("packCommentImageList",packCommentNo);
			if(packCommentImg != null) {
				dto.setPackCommentImages(packCommentImg);
			}
			List<PackCommentReplyDTO> packCommentReply = sqlMapper.selectList("packCommentReplyList",packCommentNo);
			if(packCommentReply != null) {
				dto.setPackCommentReply(packCommentReply);
			}
			dto.setPackCommentLike(sqlMapper.selectOne("packCommentLike",map));
			
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

	public PackCommentDTO packCommentView(Map map) {
		PackCommentDTO dto = sqlMapper.selectOne("packCommentView",map);
		List<String> packCommentImg = sqlMapper.selectList("packCommentImageList",map);
		if(packCommentImg != null) {
			dto.setPackCommentImages(packCommentImg);
		}
		List<PackCommentReplyDTO> packCommentReply = sqlMapper.selectList("packCommentReplyList",map);
		if(packCommentReply != null) {
			dto.setPackCommentReply(packCommentReply);
		}
		return dto;
	}

	public int packCommentImgDelete(Map map) {
		return sqlMapper.delete("packCommentImgDelete",map);
	}

	public int packCommentImgUpdate(Map map) {

		return sqlMapper.insert("packCommentImgUpdate",map);
	}

	public int packCommentReplyInsert(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("packCommentReplyInsert",map);
	}

	public Map packCommentReplySelectOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("packCommentReplySelectOne",map);
	}

	public int packCommentReplyDelete(Map map) {

		return sqlMapper.delete("packCommentReplyDelete",map);
	}

	public String packCommentLike(Map map) {
		
		String isLike = sqlMapper.selectOne("packCommentLike",map);
		if(isLike.equals("1")) {
			sqlMapper.delete("packCommentLikeDelete",map);
			return "disLike";
		}
		else {
			sqlMapper.insert("packCommentLikeInsert",map);
			return "like";
		}
	}

	public String packCommentLikeCount(Map map) {
		return sqlMapper.selectOne("packCommentLikeCount",map);
	}

	public String packCommentReplyCount(Map map) {
		return sqlMapper.selectOne("packCommentReplyCount",map);
	}

	public List<Map> replyMore(Map map) {
		
		return sqlMapper.selectList("packCommentReplyMore",map);
	}
	
	
}
