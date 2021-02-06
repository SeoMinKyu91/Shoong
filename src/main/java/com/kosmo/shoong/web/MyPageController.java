package com.kosmo.shoong.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.shoong.service.impl.member.MemberServiceImpl;
import com.kosmo.shoong.service.mypage.MyPageRecordService;
import com.kosmo.shoong.service.mypage.MyPageService;


@Controller
@RequestMapping("/mypage/")
public class MyPageController {

	@Resource(name="myPageService")
	private MyPageService Service;

	@Resource(name="myPageRecordService")
	private MyPageRecordService recordService;
	
	@Resource(name = "memberService")
	private MemberServiceImpl memberService;

	@RequestMapping("main.do")
	public String mypageMain(@RequestParam Map map, Model model, HttpServletRequest req) throws IOException {
		
		map.put("id", req.getSession().getAttribute("userId").toString());
	

		/* 코스 관련 */
		List<Map> recordList = Service.chartRecordselectList(map);
		List<Map> chartList = new Vector<Map>();

		int totalTime = 0;
		System.out.println("크기"+recordList.size());
		for (Map recordMap : recordList) {
			
			Map chartMap = new HashMap();
			float length = Float.valueOf((recordMap.get("DURATION").toString()));
			chartMap.put("chartLength", String.format("%.1f", length));
			
			int time = Integer.valueOf((recordMap.get("DURATION").toString()));
			totalTime += time;
			System.out.println("totalTime"+totalTime);
			String dateStr = recordMap.get("RECORD_DATE").toString();
			String date[] = dateStr.substring(0, dateStr.lastIndexOf(" ")).split("-");
			System.out.println(date[2]);
			chartMap.put("chartDate", date[2]);
			chartList.add(chartMap);
		}
		
		/*마일리지 총시간 총 시간 30시간 기준.*/
		int standardMileageTime = 60*60*30;
		System.out.println((float)totalTime/(float)standardMileageTime);
		float mileagePercentage =  (float)totalTime/(float)standardMileageTime*100;
		totalTime = (int)totalTime/60;
		int hour = (int)totalTime/60;
		int minute = totalTime%60;
		String mileage = "";
		if(hour == 0) {
			mileage = String.format("%d분", minute);
		}else {
			mileage = String.format("%d시간 %d분",hour, minute);
		}
		
		model.addAttribute("mileagePercentage",(int)mileagePercentage);
		model.addAttribute("mileage", mileage);
		model.addAttribute("chartList", chartList);

		/* 다이어리 관련 */
		List diaryList = Service.diaryselectList(map);
		model.addAttribute("diaryList", diaryList);

		/* record 지도 관련 */
		Map recordMap = recordService.selectOne(map);
		if (recordMap != null) {
			String filePath = req.getServletContext().getRealPath("/upload") + File.separator
					+ recordMap.get("RECORD_FILE_NAME");
			System.out.println("routePath:" + filePath);
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(new File(filePath))));
			StringBuffer sb = new StringBuffer();

			int data = -1;
			char[] chars = new char[1024];

			while ((data = br.read(chars)) != -1) {
				sb.append(chars, 0, data);
			}
			if (br != null)
				br.close();
			model.addAttribute("mapRecord", sb.toString());
		}

		return "mypage/mypage";
	}

	//회원 정보 변경
	@RequestMapping(value = "infoEdit.do", method = RequestMethod.POST)
	public String infoEdit(HttpServletRequest req, @RequestParam Map map, Model model) {
		map.put("userId", req.getSession().getAttribute("userId").toString());
		//Map info = new HashMap();
		//info.put("userId", req.getSession().getAttribute("userId").toString());
		System.out.println(map);
		//for(Object key:map.keySet()) {
		//	if(map.get(key)!=null) {
		//		info.put(key, map.get(key));
		//	}
		//}
		//System.out.println(info);
		System.out.println(map);
		int res = Service.update(map);
		System.out.println(res);
		if (res==0) {
			System.out.println("실패");
		}
		else {
			System.out.println("성공");
		}
		Map memberInfo = memberService.memberEditView(map);
		model.addAttribute("memberInfo", memberInfo);
		return "mypage/myInfoEdit";
	}


}
