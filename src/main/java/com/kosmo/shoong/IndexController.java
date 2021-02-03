package com.kosmo.shoong;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/empty/")
@Controller
public class IndexController {

	//테스트 및 참고용
	@RequestMapping(value = "maintemp.do", method = RequestMethod.GET)
	public String maintest() {
		return "templates/MainTemp";
	}
	
}
