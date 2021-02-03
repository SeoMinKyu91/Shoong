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

import com.kosmo.shoong.service.mypage.MyPageRecordService;
import com.kosmo.shoong.service.mypage.MyPageService;


@Controller
@RequestMapping("/mypage/")
public class MyPageController {

	@Resource(name="myPageService")
	private MyPageService Service;

	@Resource(name="myPageRecordService")
	private MyPageRecordService recordService;

	@RequestMapping("main.do")
	public String mypageMain(@RequestParam Map map, Model model, HttpServletRequest req) throws IOException {
		/* 유저 id 값 */
		// map.put("id","shoong1000@naver.com");
		if(req.getSession().getAttribute("userId")!=null) {
			System.out.println("mypageMain:"+req.getSession().getAttribute("userId").toString());
			map.put("id", req.getSession().getAttribute("userId").toString());
		} else {
			map.put("id","shoong1900@naver.com");
		}

		/* 코스 관련 */
		List<Map> recordList = Service.chartRecordselectList(map);
		List<Map> chartList = new Vector<Map>();

		float totalLength = 0;
		for (Map recordMap : recordList) {
			Map chartMap = new HashMap();
			float length = Float.valueOf((recordMap.get("RECORD_LENGTH").toString()));
			totalLength += length;
			chartMap.put("chartLength", String.format("%.1f", length));

			String dateStr = recordMap.get("RECORD_DATE").toString();
			String date[] = dateStr.substring(0, dateStr.lastIndexOf(" ")).split("-");
			System.out.println(date[2]);
			chartMap.put("chartDate", date[2]);
			chartList.add(chartMap);
		}

		model.addAttribute("totalLength", String.format("%.1f", totalLength));
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
	public String infoEdit(HttpServletRequest req, Map map, Model model) {
		map.put("userId", req.getSession().getAttribute("userId").toString());
		int res = Service.update(map);
		return "mypage/mypage";
	}


}
