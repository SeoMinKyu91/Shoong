package com.kosmo.shoong.service.course;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 COURSE_ID                                 NOT NULL NVARCHAR2(50)
 COURSE_CATE_ID                            NOT NULL NVARCHAR2(10)
 USER_ID                                   NOT NULL VARCHAR2(30)
 COURSE_NAME                                        NVARCHAR2(50)
 COURSE_INTRO                                       NVARCHAR2(500)
 COURSE_TIME                                        NVARCHAR2(10)
 COURSE_LENGTH                                      NVARCHAR2(50)
 COURSE_DATE                                        DATE
 COURSE_TAG                                         NVARCHAR2(50)
 COURSE_REGION                                      NVARCHAR2(50) 
 */
public class CourseDTO {

	private String courseId;
	private String courseName;
	private String courseIntro;
	private String courseTime;
	private String courseLength;
	private Date courseRegiDate;
	private String courseTag;
	private String courseRegion;
	
	private String userId;
	private String courseCateId;
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseIntro() {
		return courseIntro;
	}
	public void setCourseIntro(String courseIntro) {
		this.courseIntro = courseIntro;
	}
	public String getCourseTime() {
		return courseTime;
	}
	public void setCourseTime(String courseTime) {
		this.courseTime = courseTime;
	}
	public String getCourseLength() {
		return courseLength;
	}
	public void setCourseLength(String courseLength) {
		this.courseLength = courseLength;
	}
	public Date getCourseRegiDate() {
		return courseRegiDate;
	}
	public void setCourseRegiDate(Date courseRegiDate) {
		this.courseRegiDate = courseRegiDate;
	}
	public String getCourseTag() {
		return courseTag;
	}
	public void setCourseTag(String courseTag) {
		this.courseTag = courseTag;
	}
	public String getCourseRegion() {
		return courseRegion;
	}
	public void setCourseRegion(String courseRegion) {
		this.courseRegion = courseRegion;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCourseCateId() {
		return courseCateId;
	}
	public void setCourseCateId(String courseCateId) {
		this.courseCateId = courseCateId;
	}
	@Override
	public String toString() {
		return "CourseDTO [courseId=" + courseId + ", courseName=" + courseName + ", courseIntro=" + courseIntro
				+ ", courseTime=" + courseTime + ", courseLength=" + courseLength + ", courseRegiDate=" + courseRegiDate
				+ ", courseTag=" + courseTag + ", courseRegion=" + courseRegion + ", userId=" + userId
				+ ", courseCateId=" + courseCateId + "]";
	}
	
	
	
	
}