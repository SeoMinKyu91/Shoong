package com.kosmo.shoong.web;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("mypage")
public class myPageController {

	@RequestMapping("main.do")
	   public String mypageMain(@RequestParam Map map ,Model model,HttpServletRequest req) {
	      /*유저 id 값 */
		/*임시 값_추후 디비 처리할 부분*/
		 String[] labels= {"1일", "5일", "10일", "15일", "20일", "25일", "30일"};
		 int[] data= {2, 7, 15, 20, 30, 40, 80};
		  List chartlist = new Vector<Map>();
		  for(int i=0; i < 6; i++) {
			Map chartMap = new HashedMap();
			chartMap.put("label", labels[i]);
			chartMap.put("data", data[i]);
			chartlist.add(chartMap);
		  }
		  model.addAttribute("chartlist",chartlist);
		  
	      return "mypage/mypage";
	   }
	
	@RequestMapping("Diary.do")
	   public String mypageDiary(@RequestParam Map map ,Model model,HttpServletRequest req) {
	      /*유저 id 값 */


	      return "mypage/myDiaryList";
	   }

	@RequestMapping("DiaryWrite.do")
	   public String mypageDiaryWrite(@RequestParam Map map ,Model model,HttpServletRequest req) {
	      /*유저 id 값 */


	      return "mypage/myDiaryWrite";
	   }
	
	
	
}
