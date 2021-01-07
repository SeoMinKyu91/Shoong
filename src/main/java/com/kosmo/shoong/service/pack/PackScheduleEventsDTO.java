package com.kosmo.shoong.service.pack;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PackScheduleEventsDTO {
	private String id;
	private String title;
	private Date start;
	private Date end;

}
