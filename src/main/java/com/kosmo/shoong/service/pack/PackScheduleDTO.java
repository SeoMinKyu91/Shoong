package com.kosmo.shoong.service.pack;

import java.sql.Date;

public class PackScheduleDTO {

	private String packScheduleNo;
	private String userId;
	private String packId;
	private Date packScheduleStart;
	private Date packScheduleEnd;
	private String packScheduleTitle;
	private String packScheduleContent;

	public String getPackScheduleNo() {
		return packScheduleNo;
	}
	public void setPackScheduleNo(String packScheduleNo) {
		this.packScheduleNo = packScheduleNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPackId() {
		return packId;
	}
	public void setPackId(String packId) {
		this.packId = packId;
	}
	public Date getPackScheduleStart() {
		return packScheduleStart;
	}
	public void setPackScheduleStart(Date packScheduleStart) {
		this.packScheduleStart = packScheduleStart;
	}
	public Date getPackScheduleEnd() {
		return packScheduleEnd;
	}
	public void setPackScheduleEnd(Date packScheduleEnd) {
		this.packScheduleEnd = packScheduleEnd;
	}
	public String getPackScheduleTitle() {
		return packScheduleTitle;
	}
	public void setPackScheduleTitle(String packScheduleTitle) {
		this.packScheduleTitle = packScheduleTitle;
	}
	public String getPackScheduleContent() {
		return packScheduleContent;
	}
	public void setPackScheduleContent(String packScheduleContent) {
		this.packScheduleContent = packScheduleContent;
	}

}///////////class
