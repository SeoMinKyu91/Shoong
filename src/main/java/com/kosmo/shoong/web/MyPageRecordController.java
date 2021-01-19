package com.kosmo.shoong.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
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
import com.kosmo.shoong.service.mypage.MyPageRecordService;
import com.kosmo.shoong.service.mypage.MyPageService;


@Controller
@RequestMapping("/mypage/record/")
public class MyPageRecordController {
	
	@Resource(name="myPageRecordService")
	private MyPageRecordService service;
	


	@RequestMapping("list.do")
	   public String mypageMain(@RequestParam Map map ,Model model,HttpServletRequest req) throws IOException {
		/*유저 id 값 */
		  map.put("id","shoong1000@naver.com");
	    //map.put("id", req.getSession().getAttribute("userId").toString());
		  List<Map> recordList = service.selectList(map);
		  /*record 지도 관련*/
		  for(Map recordMap:recordList) {
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
			String date = recordMap.get("RECORD_DATE").toString().substring(0,10);
	    	recordMap.put("RECORD_DATE",date);
			recordMap.put("mapRecord",sb.toString());
			
		  }	
		  model.addAttribute("recordList",recordList);
	      return "mypage/myRecordList";
	   }
	

	
	
}
