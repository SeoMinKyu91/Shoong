package com.kosmo.shoong.admin.impl.member;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.admin.service.MemberAdminService;

@Repository("memberAdminDAO")
public class MemberAdminDAO implements MemberAdminService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
}
