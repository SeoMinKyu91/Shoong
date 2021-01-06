package com.kosmo.shoong.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/setting/")
public class SettingAdminController {

	@RequestMapping("main.do")
	   public String settingMain() {
	     
	      return "admin/Setting.admin";
	   }
}
