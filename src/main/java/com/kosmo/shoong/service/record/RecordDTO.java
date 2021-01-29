package com.kosmo.shoong.service.record;

/*
 RECORD_ID                                 NOT NULL NUMBER
 USER_ID                                   NOT NULL VARCHAR2(30)
 COURSE_ID                                          NVARCHAR2(10)
 RECORD_FILE_NAME                                   VARCHAR2(100)
 RECORD_LENGTH                                      FLOAT(126)
 RECORD_DATE                                        DATE
 DURATION                                           NVARCHAR2(10) 
 */

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
	private String fileName;
	private String recordLength;
	@SerializedName("startTime")
	private Date recordDate;
	private String duration;

}
