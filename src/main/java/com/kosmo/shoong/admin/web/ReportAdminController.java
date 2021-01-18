package com.kosmo.shoong.admin.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.shoong.admin.impl.report.ReportAdminServiceImpl;
import com.kosmo.shoong.admin.service.ReportAdminDTO;


@Controller
@RequestMapping("/admin/report/")
public class ReportAdminController {
	
	@Resource(name="reportAdminService")
	private ReportAdminServiceImpl service;
	
	@RequestMapping("main.do")
	   public String reportMain(@RequestParam Map map,Model model,HttpServletRequest req) {
	     
		List<ReportAdminDTO> list = service.selectList(map);
		String path=req.getContextPath();
		model.addAttribute("list", list);
	      return "admin/Report.admin";
	   }
	
}
