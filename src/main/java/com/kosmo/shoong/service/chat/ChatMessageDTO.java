package com.kosmo.shoong.service.chat;

import java.sql.Date;

public class ChatMessageDTO {
	private String chatMessageNo;
	private String chatMessageContent;
	private Date chatMessageDate;
	private String chatRoomNo;
	private String userId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getChatMessageNo() {
		return chatMessageNo;
	}
	public void setChatMessageNo(String chatMessageNo) {
		this.chatMessageNo = chatMessageNo;
	}
	public String getChatMessageContent() {
		return chatMessageContent;
	}
	public void setChatMessageContent(String chatMessageContent) {
		this.chatMessageContent = chatMessageContent;
	}
	public Date getChatMessageDate() {
		return chatMessageDate;
	}
	public void setChatMessageDate(Date chatMessageDate) {
		this.chatMessageDate = chatMessageDate;
	}
	public String getChatRoomNo() {
		return chatRoomNo;
	}
	public void setChatRoomNo(String chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}
	
	
}
