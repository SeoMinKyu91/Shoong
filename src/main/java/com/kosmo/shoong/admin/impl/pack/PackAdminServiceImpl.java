package com.kosmo.shoong.admin.impl.pack;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.admin.service.PackAdminService;

@Service("packAdminService")
public class PackAdminServiceImpl implements PackAdminService {
	
	@Resource(name="packAdminDAO")
	private PackAdminDAO dao;
}
