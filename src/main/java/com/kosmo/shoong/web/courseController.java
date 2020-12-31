package com.kosmo.shoong.web;

import java.util.Map;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kosmo.shoong.service.course.CourseDTO;
import com.kosmo.shoong.service.course.CourseService;


@Controller
@RequestMapping("/course/")
public class courseController {
	
	@Resource(name="courseService")
	private CourseService service;
	
	@RequestMapping("main.do")
	public String packMain(Model model,Map map) {
		map.put("user_ID","kim");
		CourseDTO record = service.selectOne(map);
		
		model.addAttribute("courseList",record);
		
		
		return "course/courseList/courseList";
	}
	
}
