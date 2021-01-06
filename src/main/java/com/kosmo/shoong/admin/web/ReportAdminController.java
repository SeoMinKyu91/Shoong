package com.kosmo.shoong.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/report/")
public class ReportAdminController {
	
	@RequestMapping("main.do")
	   public String reportMain() {
	     
	      return "admin/Report.admin";
	   }
	
}
