package com.kosmo.shoong.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import com.kosmo.shoong.service.gallery.GalleryService;
import com.kosmo.shoong.service.impl.member.MemberServiceImpl;
import com.kosmo.shoong.service.member.MemberDTO;


@Controller
public class GalleryController {
	
	@Resource(name="galleryService")
	private GalleryService galleryService;
	
	@Resource(name = "memberService")
	private MemberServiceImpl memberService;

	@RequestMapping("/myGallery.do")
	public String myGallery(HttpServletRequest req, Model model, Map map) {
		map.put("userId", req.getSession().getAttribute("userId").toString());
		MemberDTO dto = memberService.selectOne(map);
		model.addAttribute("name",dto.getUserName());
		List<Map> lists = galleryService.imgSelectList(map);
		//model.addAttribute("images","/images/"+src);
		model.addAttribute("imgList", lists);
		return "mypage/myGallery";
	}
	
}
