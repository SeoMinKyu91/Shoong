package com.kosmo.shoong.admin.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.shoong.admin.impl.setting.SettingAdminServiceImpl;


@Controller
@RequestMapping("/admin/setting/")
public class SettingAdminController {
	
	@Resource(name = "settingAdminService")
	private SettingAdminServiceImpl settingAdminService;
	
	
	@RequestMapping("main.do")
	   public String settingMain(Model model) {
	     model.addAttribute("adminList", settingAdminService.adminList());

	      return "admin/Setting.admin";
	   }
}
