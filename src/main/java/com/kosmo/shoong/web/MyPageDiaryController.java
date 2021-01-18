package com.kosmo.shoong.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.weaver.patterns.PerSingleton;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.shoong.service.mypage.MyPageDiaryService;



@Controller
@RequestMapping("mypage/diary/")
public class MyPageDiaryController {

	@Resource(name="myPageDiaryService")
	private MyPageDiaryService service;
	
	@RequestMapping("list.do")
	   public String mypageDiary(@RequestParam Map map ,Model model,HttpServletRequest req) {
	       /*유저 id 값 */
		    map.put("id","kim");
		  //map.put("id", req.getSession().getAttribute("userId").toString());
		    List recordlist = service.recordSelectList(map);
		    List diarylist = service.selectList(map);
		    model.addAttribute("diaryList",diarylist);
		    model.addAttribute("recordList",recordlist);
		   //실사용은 아래에
		   
		 
	      return "mypage/myDiaryList";
	   }

	@RequestMapping(value = "write.do" , method = RequestMethod.GET)
	   public String mypageDiaryWritePage(@RequestParam Map map ,Model model) {
		   model.addAttribute("recordId",map.get("recordId"));
	      return "mypage/myDiaryWrite";
	   }
	
	@RequestMapping(value = "write.do", method = RequestMethod.POST)
	   public String mypageDiaryWrite(@RequestParam Map map,Model model,HttpServletRequest req) {
		  
		 //map.put("id", req.getSession().getAttribute("userId").toString());
		   map.put("id","kim");
		  
		  
		   if( map.get("imgArry").toString().length() != 0) {
			 
				String[] imgArray = map.get("imgArry").toString().split(",");
				map.put("thumbnail",imgArray[0]);
				service.insert(map); 
				for(String imgName : imgArray) {
					map.put("imgName", imgName);
					service.imgInsert(map);	
				}
			 return String.format("forward:/mypage/diary/story/write.do?row=1&diaryCode=%d",map.get("diaryCode"));
		   }else {
			   service.insert(map); 
			   return "forward:/mypage/diary/list.do";
		   }
		
	   }
	
	
	@RequestMapping(value = "/story/write.do")
	   public String mypageDiaryStoryWrite(@RequestParam Map map, Model model) {
		  
		  System.out.println(map.get("row"));
		  System.out.println(map.get("diaryCode"));
		  Map imgMap = service.imgSelect(map);
		  model.addAttribute("imgMap",imgMap);
		  model.addAttribute("row",map.get("row"));
	      return "mypage/myDiaryStoryWrite";
	   }
	
	@RequestMapping(value = "/story/writeOk.do")
	   public String mypageDiaryStoryWriteOK(@RequestParam Map map, Model model) {
		  
		  service.imgUpdate(map);
		  int imgCount = Integer.parseInt(map.get("imgCount").toString());
		  int row = Integer.parseInt(map.get("row").toString());
		  
		  if(row < imgCount) {
			  row += 1;
			  return String.format("forward:/mypage/diary/story/write.do?row=%d&diaryCode=%s",row,map.get("diaryCode"));

		  }else {
			 return "forward:/mypage/diary/list.do";  
		  }
		  
	   }
	
	@RequestMapping("view.do")
	   public String mypageDiaryView(@RequestParam Map map ,Model model) {
	       
		    map.put("id","kim");
		    Map Diarymap  = service.selectOne(map);
		    List diaryImglist = service.imgSelectList(map);
		    model.addAttribute("diaryMap",Diarymap);
		    model.addAttribute("diaryImglist",diaryImglist);
		   //실사용은 아래에
		   //map.put("id", req.getSession().getAttribute("userId").toString());
		 
	      return "mypage/myDiaryView";
	   }
	



}
