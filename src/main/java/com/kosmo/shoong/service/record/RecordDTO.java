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
	public String getRecordId() {
		return recordId;
	}
	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getRecordLength() {
		return recordLength;
	}
	public void setRecordLength(String recordLength) {
		this.recordLength = recordLength;
	}
	public Date getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	@Override
	public String toString() {
		return "RecordDTO [recordId=" + recordId + ", userId=" + userId + ", courseId=" + courseId + ", fileName="
				+ fileName + ", recordLength=" + recordLength + ", recordDate=" + recordDate + ", duration=" + duration
				+ "]";
	}

}
