package com.kosmo.shoong.admin.impl.setting;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.admin.service.SettingAdminService;

@Service("settingAdminService")
public class SettingAdminServiceImpl implements SettingAdminService {

	@Resource(name="settingAdminDAO")
	private SettingAdminDAO dao;
}
