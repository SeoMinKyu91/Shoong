package com.kosmo.shoong.service.impl.member;

import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.member.MemberDTO;
import com.kosmo.shoong.service.member.MemberService;

@Service("memberService")
public class MemberServiceImpl  implements MemberService{

	@Resource(name="memberDAO")
	private MemberDAO memberDAO;

	@Override
	public boolean isMember(Map map) {
		return memberDAO.isMember(map);
	}////////isMember

	@Override
	public boolean isDuplicateEmail(Map map) {
		System.out.println("IMPL"+map.get("userId"));
		return memberDAO.isDuplicateEmail(map);
	}

//	@Override
//	public MemberDTO selectOne(Map map) {
//		return memberDAO.selectOne(map);
//	}//////selectOne

//	@Override
//	public List<Map> selectList(Map map) {
//		return memberDAO.selectList(map);
//	}//////selectList

	@Override
	public int insert(Map map) {
		int flag = memberDAO.insert(map);
		if(flag==1) {
			memberDAO.insertAddr(map);
			return flag;
		}
		return -1;
	}///////insert
	//이메일 인증
	@Autowired
	private JavaMailSender mailSender;

	public void mailSendWithUserKey(
			String e_mail, String userName,Map map) throws MessagingException {
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr =
				"<h2>안녕하세요:p shooong. 입니다!</h2><br><br>"
				+ "<h3>" + userName + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : "
				+ "<a href='http://localhost:8080/shoong/Member/key_alter/"+ e_mail +"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		mail.setSubject("[본인인증]:p shooong.님의 인증메일입니다", "utf-8");
		mail.setText(htmlStr, "utf-8", "html");
		mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
		mailSender.send(mail);
		insert(map);
	}//////mailSendWithUserKey

	public void findPwdMailSendWithUserKey(
			String e_mail, String userName,Map map) throws MessagingException {
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr =
				"<h2>안녕하세요:p shooong. 입니다!</h2><br><br>"
				+ "<h3>" + userName + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : "
				+ "<a href='http://localhost:8080/shoong/Member/key_alter/"+ e_mail +"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		mail.setSubject("[본인인증]:p shooong.님의 인증메일입니다", "utf-8");
		mail.setText(htmlStr, "utf-8", "html");
		mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
		mailSender.send(mail);
		insert(map);
	}//////mailSendWithUserKey

	public int insertVerify(String userId) {
		return memberDAO.insertVerify(userId);
	}
	
//	@Override
//	public int delete(Map map) {
//		return memberDAO.delete(map);
//	}////////delete

	@Override
	public int update(Map map) {
		return memberDAO.update(map);
	}//////update
	
	@Override
	public MemberDTO selectOne(Map map) {
		return memberDAO.selectOne(map);
	}

	public Map memberHasPack(Map map) {
		
		
		return memberDAO.memberHasPack(map);
	}

	@Override
	public Map memberEditView(Map map) {
		Map memberInfo = memberDAO.memberEditView(map);
		
		
		return memberInfo;
	}

}/////////////////////////////////////////////
