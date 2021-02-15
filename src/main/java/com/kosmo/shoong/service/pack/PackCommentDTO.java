package com.kosmo.shoong.service.pack;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class PackCommentDTO {
	private String packCommentNo;
	private String packCommentWriter;
	private String memberProfileImg;
	private List<String> packCommentImages;
	private String packCommentContent;
	private String packCommentLikeCount;
	private String packCommentReplyCount;
	
	
	public String getMemberProfileImg() {
		return memberProfileImg;
	}
	public void setMemberProfileImg(String memberProfileImg) {
		this.memberProfileImg = memberProfileImg;
	}
	private List<PackCommentReplyDTO> packCommentReply;
	private String packCommentLike;
	
	
	public String getPackCommentLike() {
		return packCommentLike;
	}
	public void setPackCommentLike(String packCommentLike) {
		this.packCommentLike = packCommentLike;
	}
	//게터 & 세터
	public String getPackCommentNo() {
		return packCommentNo;
	}
	public void setPackCommentNo(String packCommentNo) {
		this.packCommentNo = packCommentNo;
	}
	public String getPackCommentWriter() {
		return packCommentWriter;
	}
	public void setPackCommentWriter(String packCommentWriter) {
		this.packCommentWriter = packCommentWriter;
	}
	public List<String> getPackCommentImages() {
		return packCommentImages;
	}
	public void setPackCommentImages(List<String> packCommentImages) {
		this.packCommentImages = packCommentImages;
	}
	public String getPackCommentContent() {
		return packCommentContent;
	}
	public void setPackCommentContent(String packCommentContent) {
		this.packCommentContent = packCommentContent;
	}
	public String getPackCommentLikeCount() {
		return packCommentLikeCount;
	}
	public void setPackCommentLikeCount(String packCommentLikeCount) {
		this.packCommentLikeCount = packCommentLikeCount;
	}
	public String getPackCommentReplyCount() {
		return packCommentReplyCount;
	}
	public void setPackCommentReplyCount(String packCommentReplyCount) {
		this.packCommentReplyCount = packCommentReplyCount;
	}
	public List<PackCommentReplyDTO> getPackCommentReply() {
		return packCommentReply;
	}
	public void setPackCommentReply(List<PackCommentReplyDTO> packCommentReply) {
		this.packCommentReply = packCommentReply;
	}
	
	
	
	
	
	
}//////////
