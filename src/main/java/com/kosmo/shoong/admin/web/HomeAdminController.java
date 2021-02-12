package com.kosmo.shoong.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/home/")
public class HomeAdminController {
	
	@RequestMapping("main.do")
	   public String HomeMain() {
	     
		return "admin/Home.admin";
	   }
	
}
