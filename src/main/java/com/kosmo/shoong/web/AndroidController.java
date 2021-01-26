package com.kosmo.shoong.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.kosmo.shoong.service.impl.member.MemberServiceImpl;
import com.kosmo.shoong.service.member.MemberDTO;


//안드로이드 컨트롤러
@RestController
@RequestMapping("/android")
public class AndroidController {
	
	@Resource(name = "memberService")
	private MemberServiceImpl memberservice;
	
	/**/
	//안드 로그인
	@CrossOrigin
	@GetMapping(value="/member/json")
	public MemberDTO isMemberJsonByGet(@RequestParam Map map) {
		MemberDTO member = new MemberDTO();
		member.setUserId(map.get("id").toString());
		member.setUserPWD(map.get("pwd").toString());
		System.out.println("get:"+member.toString());
		return memberservice.isLogin(member);
	}
	
	@CrossOrigin
	@PostMapping(value="/member/json")
	public MemberDTO isMemberJsonByPost(MemberDTO member) {
		System.out.println("post:"+member.toString());
		return memberservice.isLogin(member);
	}
	/*
	@CrossOrigin
	@PostMapping(value="/course/upload/json",produces="text/plain;charset=UTF-8")
	public String courseUpload(@RequestParam Map route) throws IOException {
		System.out.println("route:"+route);
		//Set keys = route.keySet();
		//for(Object key : keys) System.out.println("key:"+key);
		StringBuffer sb = new StringBuffer();
		sb.append(route.keySet().toString());
		
		String resultStr = sb.toString();
		System.out.println("resultStr:"+resultStr);
		resultStr = resultStr.substring(1, sb.length()-2);
		System.out.println("sub:"+resultStr);
		Gson gson = new Gson();
		JsonParser parser = new JsonParser();
		JsonElement resultJson = parser.parse(resultStr);
		System.out.println("filename:"+resultJson.getAsJsonObject().get("properties").getAsJsonObject().get("filename").getAsString());
		
		return "톰캣 서버로 들어왔었다";
	}
	*/
	@CrossOrigin
	@PostMapping(value="/course/upload/json",produces="text/plain;charset=UTF-8")
	public String courseUpload(
			@RequestPart MultipartFile files,HttpServletRequest req) throws IOException {
		//파일 받아옴
		String path = req.getSession().getServletContext().getRealPath("/upload");
		File file = new File(path+File.separator+files.getOriginalFilename());
		System.out.println("file size:"+file.length());
		System.out.println("file name:"+file.getName());
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
		Gson gson = new Gson();
		JsonParser parser = new JsonParser();
		JsonElement resultJson = parser.parse(sb.toString());
		System.out.println("파싱:"+resultJson.toString());
		return "업로드 성공";
	}
	//안드 경로 전송
	//안드 경로 저장
}
