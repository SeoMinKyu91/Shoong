package com.kosmo.shoong.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/course/")
public class CourseAdminController {

	@RequestMapping("main.do")
	   public String courseMain() {
	     
	      return "admin/Course.admin";
	   }
}
