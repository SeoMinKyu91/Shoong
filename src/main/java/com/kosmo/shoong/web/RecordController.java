package com.kosmo.shoong.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.kosmo.shoong.common.FileUpDownUtils;
import com.kosmo.shoong.service.impl.badge.BadgeServiceImpl;
import com.kosmo.shoong.service.impl.record.RecordServiceImpl;
import com.kosmo.shoong.service.record.RecordDTO;

@Controller
@RequestMapping("/record")
@SessionAttributes({"userId","packId"})
public class RecordController {
	
	@Resource(name="recordService")
	private RecordServiceImpl rService;
	@Resource(name="badgeService")
	private BadgeServiceImpl bService;
	
	
	@CrossOrigin
	@ResponseBody
	@PostMapping(value="/upload/json",produces="text/plain;charset=UTF-8")
	public String recordUpload(
			@RequestPart MultipartFile files,HttpServletRequest req) throws IOException {
		//파일 받아옴
		HttpSession session = req.getSession();
		String path = session.getServletContext().getRealPath("/upload");
		
		String renameFileName = FileUpDownUtils.getNewFileName(path, files.getOriginalFilename());
		File file = new File(path+File.separator+renameFileName);
		//System.out.println("file size:"+file.length());
		//System.out.println("file name:"+file.getName());
		files.transferTo(file);
		//파일 읽기
		BufferedReader br = new BufferedReader(
				new InputStreamReader(new FileInputStream(file)));
		StringBuffer sb = new StringBuffer();

		int data = -1;
		char[] chars = new char[1024];

		while((data=br.read(chars))!=-1) {
			sb.append(chars,0,data);
		}
		//제이슨 파싱
		//new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").create();
		Gson gson = new GsonBuilder().setDateFormat("yyyy_MM_dd_HH_mm").create();
		JsonParser parser = new JsonParser();
		JsonElement resultJson = parser.parse(sb.toString());
		//System.out.println("파싱:"+resultJson.toString());
		//System.out.println("fromJson:"+gson.fromJson(resultJson.getAsJsonObject().get("properties"), RecordDTO.class));
		RecordDTO uploadRecord = gson.fromJson(
				resultJson.getAsJsonObject().get("properties"), RecordDTO.class);
		boolean flag = rService.insertRecord(uploadRecord);
		if(flag) {
			double mileage=0;
			List<String> lgthList = rService.selectMileageById(uploadRecord.getUserId());
			for(String length:lgthList) mileage += Double.parseDouble(length);
			
			System.out.println("마일리지:"+mileage);
			Map<String, String> map = new HashMap<String, String>();
			map.put("userId", uploadRecord.getUserId());
			map.put("mileage", String.valueOf(mileage));
			bService.insertBadge(map);
		}
		return flag?"업로드 성공":"업로드 실패";
	}
	
}
