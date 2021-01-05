package com.kosmo.shoong.admin.impl.setting;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.admin.service.SettingAdminService;

@Repository("settingAdminDAO")
public class SettingAdminDAO implements SettingAdminService{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
}
