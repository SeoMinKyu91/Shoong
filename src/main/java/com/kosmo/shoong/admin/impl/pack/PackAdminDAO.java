package com.kosmo.shoong.admin.impl.pack;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.admin.service.PackAdminService;

@Repository("packAdminDAO")
public class PackAdminDAO implements PackAdminService {

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
}
