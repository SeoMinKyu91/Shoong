package com.kosmo.shoong.web;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.shoong.service.mypage.MyPageDiaryService;



@Controller
@RequestMapping("/mypage/diary/")
public class MyPageDiaryController {

	@Resource(name="myPageDiaryService")
	private MyPageDiaryService service;

	@RequestMapping("list.do")
	   public String mypageDiary(@RequestParam Map map ,Model model,HttpServletRequest req) {
	       /*유저 id 값 */
		  //map.put("id","shoong1000@naver.com");
		  map.put("id", req.getSession().getAttribute("userId").toString());
		    List<Map> recordlist = service.recordSelectList(map);
		    for(Map recordMap: recordlist) {
		    	 String date = recordMap.get("RECORD_DATE").toString().substring(0,10);
		    	 recordMap.put("RECORD_DATE",date);
		    }
		    //List recordlist = service.recordSelectList(map);
		    List diarylist = service.selectList(map);
		    model.addAttribute("diaryList",diarylist);
		    model.addAttribute("recordList",recordlist);
		   //실사용은 아래에


	      return "mypage/myDiaryList";
	   }

	@RequestMapping(value = "write.do" , method = RequestMethod.GET)
	   public String mypageDiaryWritePage(@RequestParam Map map ,Model model,HttpServletRequest req) throws IOException {
		  //map.put("id","shoong1000@naver.com");
		  model.addAttribute("recordId",map.get("recordId"));
		  map.put("id", req.getSession().getAttribute("userId").toString());

		  /*record 지도 관련*/
		  Map recordMap =  service.recordSelectOne(map);
		  String filePath = req.getServletContext().getRealPath("/upload")+File.separator+recordMap.get("RECORD_FILE_NAME");
			System.out.println("routePath:"+filePath);
			BufferedReader br =
					new BufferedReader(
							new InputStreamReader(
									new FileInputStream(new File(filePath))));
			StringBuffer sb = new StringBuffer();

			int data = -1;
			char[] chars = new char[1024];

			while((data=br.read(chars))!=-1) {
				sb.append(chars,0,data);
			}
			if(br!=null) br.close();
			model.addAttribute("mapRecord",sb.toString());
	      return "mypage/myDiaryWrite";
	   }

	@RequestMapping(value = "write.do", method = RequestMethod.POST)
	   public String mypageDiaryWrite(@RequestParam Map map,Model model,HttpServletRequest req) {

		 map.put("id", req.getSession().getAttribute("userId").toString());
		 // map.put("id","shoong1000@naver.com");


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
	   public String mypageDiaryView(@RequestParam Map map ,Model model,HttpServletRequest req) throws IOException {
		   map.put("id", req.getSession().getAttribute("userId").toString());
			//map.put("id","shoong1000@naver.com");
		    Map Diarymap  = service.selectOne(map);

	    	String date = Diarymap.get("DIARY_DATE").toString().substring(0,10);
	    	Diarymap .put("DIARY_DATE",date);

		    List diaryImglist = service.imgSelectList(map);
		    model.addAttribute("diaryMap",Diarymap);
		    model.addAttribute("diaryImglist",diaryImglist);

		    //
		    String filePath = req.getServletContext().getRealPath("/upload")+File.separator+Diarymap.get("RECORD_FILE_NAME");
			System.out.println("routePath:"+filePath);
			BufferedReader br =
					new BufferedReader(
							new InputStreamReader(
									new FileInputStream(new File(filePath))));
			StringBuffer sb = new StringBuffer();

			int data = -1;
			char[] chars = new char[1024];

			while((data=br.read(chars))!=-1) {
				sb.append(chars,0,data);
			}
			if(br!=null) br.close();
			model.addAttribute("mapRecord",sb.toString());

	      return "mypage/myDiaryView";
	   }




}
