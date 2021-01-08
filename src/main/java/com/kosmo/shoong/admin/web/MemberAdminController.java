package com.kosmo.shoong.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/member/")
public class MemberAdminController {

	@RequestMapping("main.do")
	   public String memberMain() {
	     
	      return "admin/Member.admin";
	   }
}
