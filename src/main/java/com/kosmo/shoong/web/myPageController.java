package com.kosmo.shoong.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.shoong.service.mypage.MyPageDiaryService;
import com.kosmo.shoong.service.mypage.MyPageService;


@Controller
@RequestMapping("mypage")
public class myPageController {

	@Resource(name="myPageService")
	private MyPageService Service;

	@RequestMapping("main.do")
	   public String mypageMain(@RequestParam Map map ,Model model,HttpServletRequest req) {
		/*유저 id 값 */
	    map.put("id","kim");
	  //map.put("id", req.getSession().getAttribute("userId").toString());
		
		 List<Map> recordList = Service.chartRecordselectList(map);
		 List<Map> chartList = new Vector<Map>();
		 
		 for(Map recordMap : recordList) {
			 Map chartMap = new HashMap();
			 String lengthStr =  recordMap.get("RECORD_LENGTH").toString();
			 System.out.println(lengthStr.substring(0,lengthStr.lastIndexOf("km")));
			 chartMap.put("chartLength", lengthStr.substring(0,lengthStr.lastIndexOf("km")));
			 
			 String dateStr =  recordMap.get("RECORD_DATE").toString();
			 String date[] = dateStr.substring(0,dateStr.lastIndexOf(" ")).split("-");
			 System.out.println(date[2]);
			 chartMap.put("chartDate", date[2]);
			 
			 chartList.add(chartMap);
		 }
		 
		 model.addAttribute("chartList",chartList);
	
		 
		 /*다이어리 관련 */
		  List diaryList = Service.diaryselectList(map);
		  model.addAttribute("diaryList",diaryList);
		  
	      return "mypage/mypage";
	   }
	

	
	
}
