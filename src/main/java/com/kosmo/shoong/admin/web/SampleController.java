package com.kosmo.shoong.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/sample/")
public class SampleController {


	@RequestMapping("1")
	   public String sample1() {
	     
	      return "admin/sample1.admin";
	   }
	@RequestMapping("2")
	   public String sample2() {
	     
		 return "admin/sample2.admin";
	   }
	@RequestMapping("3")
	   public String sample3() {
	     
		 return "admin/sample3.admin";
	   }
}
