package com.kosmo.shoong.admin.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.shoong.admin.impl.member.MemberAdminServiceImpl;

@Controller
@RequestMapping("/admin/member/")
public class MemberAdminController {
	
	@Resource(name="memberAdminService")
	private MemberAdminServiceImpl memberAdminService;

	@RequestMapping("main.do")
	public String memberMain(Model model) {
		model.addAttribute("memberList",memberAdminService.memberList());
	    System.out.println(memberAdminService.memberList());
	    return "admin/Member.admin";
	}
	
	@RequestMapping("search.do")
	public String memberSearch(@RequestParam(defaultValue="searchType") String searchType,
								@RequestParam(defaultValue="") String keyword, Model model) {
		Map map = new HashMap();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		model.addAttribute("memberList",memberAdminService.memberSearch(map));
		model.addAttribute("keyword",keyword);
		model.addAttribute("searchType",searchType);
		return "admin/Member.admin";
	}
	
	@RequestMapping(value="/memberDelete.do", method=RequestMethod.POST)
	public String memberDelete(HttpServletRequest request) {
		Map map = new HashMap();
		map.put("id", request.getParameter("id"));
		System.out.println("컨트롤러안");
		System.out.println(request.getParameter("id"));
		memberAdminService.deleteMember(map);
		return "admin/Member.admin";
	}
}
