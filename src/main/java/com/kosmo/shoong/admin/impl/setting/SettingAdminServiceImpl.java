package com.kosmo.shoong.admin.impl.setting;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.admin.service.SettingAdminService;

@Service("settingAdminService")
public class SettingAdminServiceImpl implements SettingAdminService {

	@Resource(name="settingAdminDAO")
	private SettingAdminDAO dao;

	@Override
	public List<Map> adminList() {
		return dao.adminList();
	}
}
