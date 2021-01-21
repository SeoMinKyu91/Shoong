package com.kosmo.shoong.service.pack;

import java.sql.Date;

public class PackScheduleEventsDTO {
	private String packId;
	private String packScheduleTitle;
	private Date packScheduleStart;
	private Date packScheduleEnd;

	public String getPackId() {
		return packId;
	}
	public void setPackId(String packId) {
		this.packId = packId;
	}
	public String getPackScheduleTitle() {
		return packScheduleTitle;
	}
	public void setPackScheduleTitle(String packScheduleTitle) {
		this.packScheduleTitle = packScheduleTitle;
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
}
