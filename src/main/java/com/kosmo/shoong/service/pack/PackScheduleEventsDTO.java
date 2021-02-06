package com.kosmo.shoong.service.pack;

import java.sql.Date;

public class PackScheduleEventsDTO {
	private String packId;
	private String packScheduleTitle;
	private String packScheduleStart;
	private String packScheduleEnd;
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
	public String getPackScheduleStart() {
		return packScheduleStart;
	}
	public void setPackScheduleStart(String packScheduleStart) {
		this.packScheduleStart = packScheduleStart;
	}
	public String getPackScheduleEnd() {
		return packScheduleEnd;
	}
	public void setPackScheduleEnd(String packScheduleEnd) {
		this.packScheduleEnd = packScheduleEnd;
	}

	
}
