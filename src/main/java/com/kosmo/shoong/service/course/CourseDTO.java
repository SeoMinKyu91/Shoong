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
@Setter
@Getter
@ToString
public class CourseDTO {

	private String courseId;
	private String courseName;
	private String courseIntro;
	private String courseTime;
	private String courseLength;
	private Date courseRegiDate;
	private String courseRegion;
	private String courseFileName;
	
	private String userId;
	private String courseCateId;
	private String courseCateName;
}