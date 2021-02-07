package com.kosmo.shoong.web;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.shoong.service.impl.pack.PackManageServiceImpl;

@Controller
@RequestMapping("/pack/")
public class PackManageCotroller {
	
	@Resource(name="packManageService")
	private PackManageServiceImpl service;
	
	@RequestMapping("manage.do")
	public String packManage(@RequestParam Map map, Model model,HttpServletRequest req) {
		//세션에 있는 pack_id 얻어오기
		if(req.getSession().getAttribute("packId").toString() != null) {
			map.put("packId", req.getSession().getAttribute("packId").toString());
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		List<Map> joinList =  service.packJoinList(map);
		List<Map> memberList = service.packMemberList(map);
		Map packIntroSelect = service.packIntroSelect(map);
		
		for(Map item : joinList) {
			item.put("PACK_JOIN_DATE", dateFormat.format(item.get("PACK_JOIN_DATE")));
		}
		
		for(Map item : memberList) {
			item.put("PACK_JOIN_DATE",dateFormat.format(item.get("PACK_JOIN_DATE")));
			item.put("LASTCONNECT",dateFormat.format(item.get("LASTCONNECT")));
			
			
			if(item.get("AUTHORITY")==null) {
				item.put("AUTHORITY", "회원");
			}
			else if(item.get("AUTHORITY").toString().toLowerCase().equals("master")) {
				item.put("AUTHORITY", "팩장");
			}
			else {
				item.put("AUTHORITY", "부팩장");
			}
		}
		//팩 가입 신청자 목록
		model.addAttribute("packJoinList",joinList);
		
		//팩 가입자 목록
		model.addAttribute("packMemberList",memberList);
		
		//팩 정보
		model.addAttribute("packInfo",packIntroSelect);
		
		return "pack/PackManage";
	}/////////
	
	
	@RequestMapping("join.do")
	public String packJoin(@RequestParam Map map, Model model,HttpServletRequest req) {
		//세션에 있는 userID가져오기
		map.put("userID",req.getSession().getAttribute("userId").toString());
		
		service.packJoinInsert(map);
		
		return "pack/PackMain";
	}
	
	@RequestMapping("joinOk.do")
	public String packJoinOk(@RequestParam Map map,Model model) {
		int joinOk = service.packJoinUpdate(map);
		
		return "forward:/pack/manage.do";
	}///////////
	
	@RequestMapping("joinNo.do")
	public String packJoinNo(@RequestParam Map map, Model model) {
		service.packJoinDelete(map);
		
		return "forward:/pack/manage.do";
	}/////////////////
	
	@RequestMapping("member/delete.do")
	public String packMemberDelete(@RequestParam Map map, Model model) {
		
		service.packJoinDelete(map);
		
		return "forward:/pack/manage.do";
	}/////////////
	
	
	//팩 프로필 수정용 (임시작업이라 놔뒀어요)
	@RequestMapping("infoEdit.do")
	public String introEdit(@RequestParam Map map,Model model) {
		Map packInfo = service.packIntroSelect(map);
		
		model.addAttribute("packInfo",packInfo);
		
		return "pack/PackInfoEdit";
		
		
	}///////////infoEdit()
	
	@RequestMapping("infoEditOk.do")
	public String infoEditOk(@RequestParam Map map,Model model,HttpServletRequest req) {
		if(req.getSession().getAttribute("packId").toString() != null) {
			map.put("packId", req.getSession().getAttribute("packId").toString());
		}
		
		service.packInfoUpdate(map);
		
		return "forward:/pack/manage.do";
	}/////////
	

	
	
	
	
}////////////////class
