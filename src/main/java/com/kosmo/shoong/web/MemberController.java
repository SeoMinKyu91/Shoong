package com.kosmo.shoong.web;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.shoong.service.course.CourseService;
import com.kosmo.shoong.service.gallery.GalleryService;
import com.kosmo.shoong.service.impl.member.MemberServiceImpl;
import com.kosmo.shoong.service.member.MemberDTO;

@RequestMapping("/Member/")
@Controller
public class MemberController {

	@Resource(name = "memberService")
	private MemberServiceImpl memberService;

	@Resource(name="galleryService")
	private GalleryService galleryService;
	
	@Resource(name="courseService")
	private CourseService courseService;
	
	
	/////회원 가입//////

	//회원가입 입력폼
	@RequestMapping(value = "Join.do", method = RequestMethod.GET)
	public String join() {
		return "/member/Join";
	}/////join()

	//회원가입 입력처리]
	@RequestMapping(value = "Join.do", method = RequestMethod.POST)
	public String joinOk(@RequestParam Map map,Model model) throws MessagingException {
		//맵에서 유저아이디와 유저아이디 뒷자리(@gmail.com) 따로따로 받아서
		map.put("userId", map.get("userId").toString()+"@"+map.get("emailStrinput").toString());
		//map.put("userRRN", map.get("userRRN1").toString()+map.get("userRRN2").toString());
		map.put("userTel", map.get("userTel1").toString()+map.get("userTel2").toString()+map.get("userTel3").toString());
		Set keys = map.keySet();
		for(Object key:keys) System.out.println(key+":"+map.get(key));
		//다시 맵에 userId 키값으로 유저아이디@gamil.com을 밸류로 넣기
		memberService.mailSendWithUserKey(map.get("userId").toString(), map.get("userName").toString(), map);
		//활동량 설문조사페이지로 이동
		model.addAttribute("userId", map.get("userId"));
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
			json.put("passwordCheck", "");
		}
		else {
			json.put("passwordCheck", "비밀번호가 일치하지 않습니다.");
		}
		return json.toJSONString();
	}/////pwdOk

//	//이메일 형식 판단
//	@RequestMapping(value="EmailCheck.do",produces="text/html; charset=UTF-8")
//	@ResponseBody
//	public String emailOk(@RequestParam Map map) {
//		String userId = map.get("userId").toString();
//		JSONObject json = new JSONObject();
//		if(userId.trim().equals("")) {
//			json.put("emailCheck", "정확한 이메일 형식이 아닙니다.");
//			return json.toJSONString();
//		}
//		if(!CommonUtilities.isCorrectNaming(userId)) {
//			json.put("emailCheck", "정확한 이메일 형식이 아닙니다.");
//			return json.toJSONString();
//		}
//		json.put("emailCheck", "ok");
//		return json.toJSONString();
//	}////////emailOk

	//이메일(아이디)중복체크
	@RequestMapping(value = "EmailDuplCheck.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String emailDuplOk(@RequestParam Map map) {
		String userId = map.get("userId").toString();
		System.out.println("userId:"+userId);
		boolean duplEmail = memberService.isDuplicateEmail(map);
		JSONObject json = new JSONObject();
		if(duplEmail) {//가입이 됨
			json.put("duplCheck", "사용 가능한 이메일입니다.");
			return json.toJSONString();
		}
		else {//가입 안됨 - 아이디 중복
			json.put("duplCheck", "이미 있는 아이디입니다.");
			return json.toJSONString();
		}
	}////////emailDuplOk

	//이메일인증
	@RequestMapping(value = "key_alter/{userId}")
	public String emailAuth(
			@RequestParam Map map,@PathVariable String userId) {
		//.com이 빠져서 들어온다
		System.out.println("emailauth:"+userId);
		//메일에 있는 인증버튼을 누르면
		//1.서버로 요청을 해서 디비에 업데이트
		memberService.insertVerify(userId+".com");
		//2.메인페이지로 넘김
		return "/templates/Main";
	}
	//아이디찾기
	@RequestMapping(value="IDCheck.do",method=RequestMethod.GET)
	public String findId() {
		return "/member/IdFind";
	}
	//아이디찾기변경
	@RequestMapping(value="IDCheck.do",method=RequestMethod.POST)
	public String findIdOk() {

		return "/templates/Main";
	}
	//비밀번호찾기페이지
	@RequestMapping(value="PWDCheck1.do",method=RequestMethod.GET)
	public String findPwd() {
		return "/member/PwdFind1";
	}
	//비밀번호찾기페이지에서 이메일보내기
	@RequestMapping(value="PWDCheck1.do",method=RequestMethod.POST)
	public String findPwdSendEmail(@RequestParam Map map) {

		return "/templates/Main";
	}
	//비번찾기변경
	@RequestMapping(value="PWDCheck/{userId}",method=RequestMethod.POST)
	public String findPwdOk(@PathVariable String userId) {

		return "/templates/Main";
	}//////

	/////활동량 설문조사////
	//활동량 설문조사폼으로 이동
	@RequestMapping(value = "Frequency.do", method = RequestMethod.GET)
	public String frequency() {
		return "/member/Frequency";
	}///

	//설문조사 처리
	@RequestMapping(value = "Frequency.do", method = RequestMethod.POST)
	public String frequency(
			@RequestParam Map map,
			@RequestParam(value="userId",required=false) String userId) {
		map.put("userId", userId);
		Set keys = map.keySet();
		for(Object key:keys) System.out.println(key+":"+map.get(key));
		//멤버서비스 호출
		memberService.update(map);
		//맵넘겨주기
		return "templates/Main";
	}
	/////로그인//////
	//kakao login api 전용 컨트롤러


	//로그인 입력폼
	@RequestMapping(value="Login.do", method = RequestMethod.GET)
	public String login() {
		return "/member/Login";
	}//////login

	//로그인 처리]
	@RequestMapping(value = "Login.do",method = RequestMethod.POST)
	public String loginOk(HttpSession session, @RequestParam Map map,HttpServletRequest req) {
		
		session = req.getSession();
		boolean flag = memberService.isMember(map);
		
		Map mamberHasPack = memberService.memberHasPack(map);
		if(flag) {
			session.setAttribute("userId", map.get("userId"));
			if(mamberHasPack != null) {
				System.out.println("memberHasPack:"+mamberHasPack.get("PACK_ID"));
				session.setAttribute("packId", mamberHasPack.get("PACK_ID"));
				
			}
			
		}
		else {
			session.setAttribute("error", "아이디와 비밀번호가 일치하지 않습니다.");
			return "redirect:/Member/Login.do";
		}
		//로그인 후 메인페이지로 이동
		return "/templates/Main";
	}////loginOk

	//로그아웃]
	@RequestMapping("Logout.do")
	public String logout(HttpSession session, HttpServletRequest req) {
		session = req.getSession();
		//로그아웃 처리-세션영역 데이타 삭제
		session.invalidate();
		//뷰정보 반환]
		return "/templates/Main";
	}/////////////logout

	//비회원로그인용]
	@RequestMapping(value = "GuestLogin.do")
	public String guestLogin(HttpSession session,HttpServletRequest req,@RequestParam Map map) {
		session = req.getSession();
		String guest = (String)session.getAttribute("userId");
		session.setAttribute("userId", "guest");
		return "/templates/Main";
	}///////guestLogin

	//ID/PW 찾기용]
	
	
	////
	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest req, Map map, Model model) {
		map.put("userId", req.getSession().getAttribute("userId").toString());

		System.out.println("mypage()"+req.getSession().getAttribute("userId").toString());

		MemberDTO dto = memberService.selectOne(map);
		model.addAttribute("name",dto.getUserName());

		List<Map> lists = galleryService.imgFirstList(map);
		System.out.println(lists);
		model.addAttribute("imgList", lists);
		for(Map list : lists) System.out.println(list);

		List<Map> courselists = courseService.showCourse(map);
		//for(Map courseList:courselists)
			//courseList.put("COURSE_DATE", courseList.get("COURSE_DATE").toString().substring(0,10));
		//model.addAttribute("courseList", courselists);
		return "mypage/mypage";
	}
		
	@RequestMapping("/myInfoEdit.do")
	public String myInfoEdit(HttpServletRequest req, Map map, Model model) {
		map.put("userId", req.getSession().getAttribute("userId").toString());
		Map memberInfo = memberService.memberEditView(map);
		model.addAttribute("memberInfo", memberInfo);
		System.out.println(memberInfo);
		return "mypage/myInfoEdit";
	}
	
}/////class
