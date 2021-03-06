package com.kosmo.shoong.service.impl.member;

import java.util.List;
import java.util.Map;
import java.util.Set;

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
		return sqlMapper.insert("memberVerify",userId);
	}

	public int insertAddr(Map map) {
		return sqlMapper.insert("insertAddr",map);
	}

//	@Override
//	public int delete(Map map) {
//		return sqlMapper.delete("memberDelete", map);
//	}//////delete
	//활동량 설문조사에 대한 memberUpdate (회원정보수정 아님)
	@Override
	public int update(Map map) {
		return sqlMapper.update("memberUpdate", map);
	}///////update
	
	@Override
	public int memberEdit(Map map) {
		System.out.println("dad안");
		Set keys = map.keySet();
		for(Object key:keys) System.out.println(key+":"+map.get(key).toString());
		int res = sqlMapper.update("memberEditDo", map);
		return res;
	}///////update

	@Override
	public MemberDTO selectOne(Map map) {
		return sqlMapper.selectOne("selectOne",map);
	}

	@Override
	public Map memberEditView(Map map) {
		return sqlMapper.selectOne("memberEditList",map);
	}


	public Map memberHasPack(Map map) {
		return sqlMapper.selectOne("memberHasPack",map);
	}

	@Override
	public MemberDTO isLogin(MemberDTO member) {
		return sqlMapper.selectOne("memberIsLogin",member);
	}

	public int profileImgUpdate(Map map) {
		return sqlMapper.update("profileImgUpdate",map);
	}

	public String hasProfileImg(Map map) {
		return sqlMapper.selectOne("hasProfileImg",map);
	}

	public int profileImgInsert(Map map) {
		return sqlMapper.insert("profileImgInsert",map);
	}

	public List<Map> memberHasBadgeNames(Map map) {
		return sqlMapper.selectList("memberHasBadgeNames",map);
	}

	public Map chat(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("chat",map);
	}

	public String memberName(Map map) {
		return sqlMapper.selectOne("memberName",map);
	}


}////////////class
