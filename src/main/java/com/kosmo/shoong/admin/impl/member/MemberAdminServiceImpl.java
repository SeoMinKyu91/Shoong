package com.kosmo.shoong.admin.impl.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.admin.service.MemberAdminService;

@Service("memberAdminService")
public class MemberAdminServiceImpl implements MemberAdminService {
	
	@Resource(name="memberAdminDAO")
	private MemberAdminDAO dao;

	@Override
	public List<Map> memberList() {
		return dao.memberList();
	}

	@Override
	public List<Map> memberSearch(Map map) {
		// TODO Auto-generated method stub
		return dao.memberSearch(map);
	}
	
	
}
