package com.kosmo.shoong.web;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.shoong.service.impl.member.MemberServiceImpl;
import com.kosmo.shoong.service.member.KakaoLoginService;

@Controller
@RequestMapping("/kakao")
public class KakaoLoginController {

	@Resource(name = "kakaoService")
	private KakaoLoginService kakaoService;
	@Resource(name = "memberService")
	private MemberServiceImpl memberService;

	@RequestMapping("/login")
	public String login(
			@RequestParam("code") String code, HttpSession session, Model model) {
		System.out.println("code:" + code);
		String access_Token = kakaoService.getAccessToken(code);

		HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
		System.out.println("토큰:" + access_Token);
		session.setAttribute("access_Token", access_Token);

		System.out.println("login Controller : " + userInfo);

		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if (userInfo.get("email") != null) {
			session.setAttribute("userId", userInfo.get("email"));
			// session.setAttribute("access_Token", access_Token);
		}
		model.addAttribute("userInfo", userInfo);
		System.out.println("카카오톡 로그인 성공!");
		return "forward:/kakao/KakaoJoin.do";
	}
	//회원가입 입력폼]
	@RequestMapping(value = "KakaoJoin.do", method = RequestMethod.GET)
	public String join() {
		return "member/KakaoJoin";
	}/////join()
	
	//입력하는 컨트롤러
	//회원가입 입력처리]
	@RequestMapping(value = "KakaoJoin.do", method = RequestMethod.POST)
	public String joinOk(@RequestParam Map map,Model model) throws MessagingException {
		map.put("userTel", map.get("userTel1").toString()+map.get("userTel2").toString()+map.get("userTel3").toString());
//			Set keys = map.keySet();
//			for(Object key:keys) System.out.println(key+":"+map.get(key));
		//활동량 설문조사페이지로 이동
		model.addAttribute("userId", map.get("userId"));
		//VERIFY UPDATE
		memberService.insert(map);
		memberService.insertVerify(map.get("userId").toString());
		return "redirect:/Member/Frequency.do";
	}/////joinOk

	//비밀번호확인용]
	@RequestMapping(value="PWDCheck.do",produces="text/html; charset=UTF-8")
	@ResponseBody
	public String pwdOk(@RequestParam Map map) {
		String userPWD = map.get("userPWD").toString();
		String userPWDOk = map.get("userPWDOk").toString();
		JSONObject json = new JSONObject();
		if(userPWD.equals(userPWDOk)) {
			json.put("passwordCheck", "비밀번호가 일치합니다.");
		}
		else {
			json.put("passwordCheck", "비밀번호가 일치하지 않습니다.");
		}
		return json.toJSONString();
	}/////pwdOk

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("logout here");
		System.out.println(session.getAttribute("access_Token"));
		kakaoService.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		System.out.println("카카오톡 로그아웃!");
		return "templates/Main";
	}
}