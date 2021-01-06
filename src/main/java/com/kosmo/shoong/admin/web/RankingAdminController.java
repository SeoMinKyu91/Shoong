package com.kosmo.shoong.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/ranking/")
public class RankingAdminController {

	@RequestMapping("main.do")
	   public String rankingMain() {
	     
	      return "admin/Ranking.admin";
	   }
}
