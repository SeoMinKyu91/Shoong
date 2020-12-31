package com.kosmo.shoong.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import com.kosmo.shoong.service.gallery.GalleryService;


@Controller
public class GalleryController {
	
	@Resource(name="galleryService")
	private GalleryService galleryService;

	@RequestMapping("/myGallery.do")
	public String myGallery(Model model, Map map) {
		map.put("userID", "test");
		List<Map> lists = galleryService.imgSelectList(map);
		//model.addAttribute("images","/images/"+src);
		model.addAttribute("imgList", lists);
		return "mypage/myGallery";
	}
	
}
