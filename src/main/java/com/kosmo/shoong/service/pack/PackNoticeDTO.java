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
	
	
	
}////////////class
