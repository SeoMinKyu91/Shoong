package com.kosmo.shoong.service.record;


import java.util.Date;

import com.google.gson.annotations.SerializedName;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RecordDTO {
	
	private String recordId;
	@SerializedName("userId")
	private String userId;
	private String courseId;
	@SerializedName("filename")
	private String filename;
	private String recordLength;
	@SerializedName("startTime")
	private Date recordDate;
	private String duration;

}
