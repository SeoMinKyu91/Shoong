package com.kosmo.shoong.service.impl.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.member.MemberDTO;
import com.kosmo.shoong.service.member.MemberService;

@Repository
public class MemberDAO implements MemberService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public boolean isMember(Map map) {
		return (Integer)sqlMapper.selectOne("memberIsMember",map)==1?true:false;
	}/////isMember
	
	@Override
	public boolean isDuplicateEmail(Map map) {
		System.out.println("DAO"+map.get("userId"));
		return (Integer)sqlMapper.selectOne("duplEmail",map.get("userId").toString())==1?false:true;
	}
	
	
//	@Override
//	public MemberDTO selectOne(Map map) {
//		return sqlMapper.selectOne("memberSelectOne",map);
//	}///////selectOne

//	@Override
//	public List<Map> selectList(Map map) {
//		return sqlMapper.selectList("memberSelectList",map);
//	}/////selectList

	@Override
	public int insert(Map map) {
		return sqlMapper.insert("memberInsert", map);
	}//////insert	

	public int insertVerify(String userId) {
		System.out.println("userId:"+userId);
		return (Integer)sqlMapper.insert("memberVerify",userId);
	}
	
	public int insertAddr(Map map) {
		return (Integer)sqlMapper.insert("insertAddr",map);
	}


//	@Override
//	public int delete(Map map) {
//		return sqlMapper.delete("memberDelete", map);
//	}//////delete

	@Override
	public int update(Map map) {
		return sqlMapper.update("memberUpdate", map);
	}///////update
	
	@Override
	public MemberDTO selectOne(Map map) {
		System.out.println("dao안------------------------");
		return sqlMapper.selectOne("selectOne",map);
	}

	public Map memberHasPack(Map map) {
		return sqlMapper.selectOne("memberHasPack",map);
	}
	

}////////////class
