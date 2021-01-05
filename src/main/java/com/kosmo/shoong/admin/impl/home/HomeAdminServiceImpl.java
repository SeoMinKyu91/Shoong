package com.kosmo.shoong.admin.impl.home;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.kosmo.shoong.admin.service.HomeAdminService;

@Service("homeAdminService")
public class HomeAdminServiceImpl implements HomeAdminService{
	
	@Resource(name="homeAdminDAO")
	private HomeAdminDAO dao;
}
