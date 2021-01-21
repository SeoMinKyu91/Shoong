package com.kosmo.shoong.service.pack;

import java.util.Date;

import org.springframework.stereotype.Controller;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PackNoticeDTO {
	private String packNoticeNo;//글 번호
	private String userName;//
	private String userID;
	private String packID;
	private String packNoticeTitle;//제목
	private java.sql.Date packNoticeDate;//작성일
	private String packNoticeContent;//글 내용
	
	public String getPackNoticeNo() {
		return packNoticeNo;
	}
	public void setPackNoticeNo(String packNoticeNo) {
		this.packNoticeNo = packNoticeNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPackID() {
		return packID;
	}
	public void setPackID(String packID) {
		this.packID = packID;
	}
	public String getPackNoticeTitle() {
		return packNoticeTitle;
	}
	public void setPackNoticeTitle(String packNoticeTitle) {
		this.packNoticeTitle = packNoticeTitle;
	}
	public java.sql.Date getPackNoticeDate() {
		return packNoticeDate;
	}
	public void setPackNoticeDate(java.sql.Date packNoticeDate) {
		this.packNoticeDate = packNoticeDate;
	}
	public String getPackNoticeContent() {
		return packNoticeContent;
	}
	public void setPackNoticeContent(String packNoticeContent) {
		this.packNoticeContent = packNoticeContent;
	}
	
}////////////class
