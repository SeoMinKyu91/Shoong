package com.kosmo.shoong.admin.impl.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.admin.service.MemberAdminService;

@Repository("memberAdminDAO")
public class MemberAdminDAO implements MemberAdminService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<Map> memberList() {
		return sqlMapper.selectList("memberList");
	}

	@Override
	public List<Map> memberSearch(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("memberSearch",map);
	}
	
	
}
