package com.kosmo.shoong.service.impl.pack;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.pack.PackCommentDTO;
import com.kosmo.shoong.service.pack.PackCommentService;

@Repository
public class PackCommentDAO implements PackCommentService {
	
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public boolean isLogin(Map map) {
		return (Integer)sqlMapper.selectOne("memoIsLogin", map) == 1 ? true : false;
	}
	
	@Override
	public List<PackCommentDTO> selectList(Map map){
		return sqlMapper.selectList("memoSelectList",map);
	}
	@Override
	public PackCommentDTO selectOne(Map map) {
		return sqlMapper.selectOne("memoSelectOne", map);
	}
	@Override
	public int insert(Map map) {
		return sqlMapper.insert("commentInsert",map);
	}
	@Override
	public int delete(Map map) {
		
		sqlMapper.delete("commentDeleteByNo",map);
		return sqlMapper.delete("commentDelete",map);
	}
	@Override
	public int update(Map map) {
		return sqlMapper.update("commentUpdate",map);
	}
}
