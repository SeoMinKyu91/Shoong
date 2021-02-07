package com.kosmo.shoong.admin.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.shoong.admin.impl.pack.PackAdminServiceImpl;


@Controller
@RequestMapping("/admin/pack/")
public class PackAdminController {

	@Resource(name="packAdminService")
	private PackAdminServiceImpl packAdminService;
	
	@RequestMapping("main.do")
	   public String packMain(Model model) {
		model.addAttribute("packList",packAdminService.selectList());
	      return "admin/Pack.admin";
	   }
}
