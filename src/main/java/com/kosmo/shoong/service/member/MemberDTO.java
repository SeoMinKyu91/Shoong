package com.kosmo.shoong.service.member;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class MemberDTO {

	private String userId;
	private String userPWD;
	private String userName;
	private String userGender;
	private String userAge;
	private String userAddr; // 주 활동지
	private String userTel; // 핸드폰 번호
	private Date lastAccess; //최근접속일
	private Date userJoinDate; //회원 가입 한 날
	private String userFrequeny;
	
	//latlng 칼럼명을 가진 멤버 추가 setter getter 추가
	private String user_lat;
	private String user_lng;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPWD() {
		return userPWD;
	}
	public void setUserPWD(String userPWD) {
		this.userPWD = userPWD;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserAge() {
		return userAge;
	}
	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public Date getLastAccess() {
		return lastAccess;
	}
	public void setLastAccess(Date lastAccess) {
		this.lastAccess = lastAccess;
	}
	public Date getUserJoinDate() {
		return userJoinDate;
	}
	public void setUserJoinDate(Date userJoinDate) {
		this.userJoinDate = userJoinDate;
	}
	public String getUserFrequeny() {
		return userFrequeny;
	}
	public void setUserFrequeny(String userFrequeny) {
		this.userFrequeny = userFrequeny;
	}
	//latlng
	public String getUser_lat() {
		return user_lat;
	}
	public void setUser_lat(String user_lat) {
		this.user_lat = user_lat;
	}
	public String getUser_lng() {
		return user_lng;
	}
	public void setUser_lng(String user_lng) {
		this.user_lng = user_lng;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", userPWD=" + userPWD + ", userName=" + userName + ", userGender="
				+ userGender + ", userAge=" + userAge +", userAddr=" + userAddr + ", userTel=" + userTel + ", lastAccess=" + lastAccess
				+ ", userJoinDate=" + userJoinDate + ", userFrequeny=" + userFrequeny + "]";
	}
	
	
}
