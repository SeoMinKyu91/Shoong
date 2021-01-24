package com.kosmo.shoong.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
	
	//안드 경로 전송
	//안드 경로 저장
}
