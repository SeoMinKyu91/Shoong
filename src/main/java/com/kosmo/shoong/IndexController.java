package com.kosmo.shoong;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	//테스트 및 참고용
	@RequestMapping("test.do")
	public String test() {
		
		return "templates/ExampleTemplate";
	}
	
}
