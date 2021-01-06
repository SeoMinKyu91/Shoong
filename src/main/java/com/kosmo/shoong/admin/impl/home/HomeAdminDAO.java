package com.kosmo.shoong.admin.impl.home;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.admin.service.HomeAdminService;

@Repository("homeAdminDAO")
public class HomeAdminDAO implements HomeAdminService{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
}
