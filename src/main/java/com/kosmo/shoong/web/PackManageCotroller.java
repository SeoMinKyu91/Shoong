package com.kosmo.shoong.web;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.shoong.service.impl.pack.PackManageServiceImpl;

@Controller
@RequestMapping("/pack/")
public class PackManageCotroller {
	
	@Resource(name="packManageService")
	private PackManageServiceImpl service;
	
	//팩 프로필 수정용 (임시작업이라 놔뒀어요)
//	@RequestMapping("pack/infoEdit.do")
//	public String infoEdit() {
//		
//		
//		return "pack/PackInfoEdit";
//		return "pack/PackInfoEdit";
//	}///////////infoEdit()
	
//	@RequestMapping("pack/introEdit.do")
//	public String introEdit() {
//		return "pack/PackIntroEdit";
//	}//////////////introEdit
	
	@RequestMapping("manage.do")
	public String packManage(@RequestParam Map map, Model model,HttpServletRequest req) {
		
		
		//세션에 있는 pack_id 얻어오기
		map.put("packId", req.getSession().getAttribute("packId").toString());
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		List<Map> joinList =  service.packJoinList(map);
		List<Map> memberList = service.packMemberList(map);
		
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
		
		System.out.println("팩NO: "+map.get("packJoinNo"));
		
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
		
		
		
		if(service.packSelectManager(map)) {
			System.out.println("매니저임");
			service.packManagerDelete(map);
		}//////////
		
		service.packJoinDelete(map);
		
		
		
		return "forward:/pack/manage.do";
	}
	
	
	
	
}////////////////class
