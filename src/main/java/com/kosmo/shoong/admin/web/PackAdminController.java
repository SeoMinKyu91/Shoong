package com.kosmo.shoong.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/pack/")
public class PackAdminController {

	@RequestMapping("main.do")
	   public String packMain() {
	     
	     return "admin/Pack.admin";
	   }
}
