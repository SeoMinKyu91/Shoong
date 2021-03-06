package com.kosmo.shoong.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.shoong.service.impl.member.MemberServiceImpl;
import com.kosmo.shoong.service.impl.pack.PackNoticeServiceImpl;
import com.kosmo.shoong.service.impl.pack.PackServiceImpl;
import com.kosmo.shoong.service.pack.PackDTO;
import com.kosmo.shoong.service.pack.PackGalleryDTO;
import com.kosmo.shoong.service.pack.PackGalleryService;
import com.kosmo.shoong.service.pack.PackNoticeDTO;
import com.kosmo.shoong.service.pack.PackService;


@Controller
@RequestMapping("/pack/")
public class PackController {
	@Resource(name = "packService")
	private PackServiceImpl service;
	@Resource(name = "packGalleryService")
	private PackGalleryService galleryService;
	@Resource(name = "packNoticeService")
	private PackNoticeServiceImpl packNoticeService;

	@Resource(name = "memberService")
	private MemberServiceImpl memberService;

	@RequestMapping("main.do")
	public String packMain(@RequestParam Map map, Model model, HttpServletRequest req) {
		System.out.println("내꺼검샘이애");
		if (map.get("lat") != null) {
			System.out.println("검샘");
			model.addAttribute("searchLat", map.get("lat"));
			model.addAttribute("searchLng", map.get("lng"));
			model.addAttribute("searchRegion", map.get("searchRegion"));

		} else {
			System.out.println("내꺼검샘");
			String id = req.getSession().getAttribute("userId").toString();
			Map userAddress = service.selectOneUserAddr(id);
			map.put("myRegion", userAddress.get("ADDRESS"));
			model.addAttribute("searchRegion", userAddress.get("ADDRESS").toString());
			model.addAttribute("searchLat", userAddress.get("USER_LAT"));
			model.addAttribute("searchLng", userAddress.get("USER_LNG"));
		}

		List<PackDTO> packList = service.selectList(map);
		model.addAttribute("packList", packList);
		/*
		 * 유저정보에 ADDRESS로는 정확도 부족 lat,lng 받아서 기반 검색. 주석 풀지 마세요. map.put("userId",
		 * req.getSession().getAttribute("userId").toString()); Map userAddress =
		 * service.selectOneUserAddr(map); if(userAddress.get("ADDRESS") != null) {
		 * 
		 * map.put("searchRegion", userAddress.get("ADDRESS"));
		 * model.addAttribute("searchRegion",userAddress.get("ADDRESS")); }
		 */

		if (req.getSession().getAttribute("packId") == null) {
			return "pack/PackMain";
		} else {
			return "forward:/pack/view.do";
		}
	}

	// 팩 생성 페이지로 이동 get
	@RequestMapping("create.do")
	public String packCreate(Model model, HttpServletRequest req) {
		String id = req.getSession().getAttribute("userId").toString();
		Map userAddress = service.selectOneUserAddr(id);
		model.addAttribute("searchLat", userAddress.get("USER_LAT"));
		model.addAttribute("searchLng", userAddress.get("USER_LNG"));
		return "pack/PackCreate";
	}

	// 팩 생성 페이지 - 팩 생성 post
	@RequestMapping("createOk.do")
	public String packCreateOk(@RequestParam Map map, HttpServletRequest req) {

		service.insert(map);

		map.put("userId", req.getSession().getAttribute("userId").toString());
		// 마이바티스 처리로 map에 PK 받아왔음. packId에 저장 되어있다
		service.insertCreate(map);
		service.insertJoin(map);
		service.insertManager(map);

		Map mamberHasPack = memberService.memberHasPack(map);
		if (mamberHasPack != null) {
			req.getSession().setAttribute("packId", mamberHasPack.get("PACK_ID"));
		}

		return "forward:/pack/main.do";
	}

	@RequestMapping("view.do")
	public String packView(@RequestParam Map map, Model model, HttpServletRequest req) {
		// 로그인 아이디,팩 아이디 설정 나중에 세션에서 값불러오는걸로 대체
		map.put("loginId", req.getSession().getAttribute("userId").toString());
		map.put("packId", req.getSession().getAttribute("packId").toString());
		map.put("userId", req.getSession().getAttribute("userId").toString());

		// 관리자 확인용
		if (packNoticeService.isManager(map)) {
			model.addAttribute("manager", "manager");
		}

		int recordCount = packNoticeService.getTotalRecord(map);

		if (recordCount >= 4) {
			map.put("start", 1);
			map.put("end", 4);
			model.addAttribute("totalRecordCount", 4);
		} else {
			map.put("start", 1);
			map.put("end", recordCount);
			model.addAttribute("totalRecordCount", recordCount);
		}

		List<PackNoticeDTO> packNoticeList = packNoticeService.selectList(map);

		model.addAttribute("list", packNoticeList);

		List<PackGalleryDTO> GalleryList = galleryService.selectList(map);

		System.out.println("갤럴리 사진이름");
		
		for (PackGalleryDTO dto : GalleryList) {
			System.out.println(dto.getPictureName());
		}

		if (GalleryList.size() > 4) {
			List<PackGalleryDTO> packGalleryList = GalleryList.subList(0, 4);
			model.addAttribute("packGalleryList", packGalleryList);
		} else {
			model.addAttribute("packGalleryList", GalleryList);
		}
		
		List<Map> rank = service.selectRankList(map);
		model.addAttribute("packRank",rank);
		
		return "pack/PackView";
	}

	@RequestMapping(value="checkPackName.do",produces="text/html; charset=UTF-8")
	@ResponseBody
	public String checkPackName(@RequestParam Map map) {
		int result = service.selectPackName(map);
		String check = "Y";
		if (result == 1) {
			check = "N";
		}
		return check;
	}//////////////

	// 팩 가입 신청
	@RequestMapping(value = "joinPack.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String joinPack(@RequestParam Map map, HttpServletRequest req) {
		map.put("userId", req.getSession().getAttribute("userId").toString());
		map.put("managerOrUser", "user");
		service.insertJoin(map);
		// 필요x반환값 void 로 바꾸기
		String check = "Y";
		return check;
	}//////////////
	
	
	@RequestMapping("rank.do")
	public String packRank(@RequestParam Map map, Model model,HttpSession session) {
		map.put("packId", session.getAttribute("packId"));
		List<Map> rank = service.selectRankList(map);
		System.out.println("가보자가보자~~");
		for(Map item : rank) {
			System.out.println(item.get("NAME")+"의 마일리지:"+item.get("MILEAGE"));
		}
		
		model.addAttribute("packRank",rank);
		
		return "/pack/PackRank";
	}
	
	

}