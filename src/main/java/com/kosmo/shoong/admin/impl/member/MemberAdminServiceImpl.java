package com.kosmo.shoong.admin.impl.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.admin.service.MemberAdminService;

@Service("memberAdminService")
public class MemberAdminServiceImpl implements MemberAdminService {
	
	@Resource(name="memberAdminDAO")
	private MemberAdminDAO dao;
}
