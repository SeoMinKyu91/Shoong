package com.kosmo.shoong.service.course;

import java.util.Date;

import com.google.gson.annotations.SerializedName;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CourseDTO {

	private String courseID;
	private String courseName;
	private String courseIntro;
	private String courseTime;
	private String courseLength;
	private Date courseRegiDate;
	private String courseTag;
	private String courseRegion;
	
	private String userId;
	private String courseCateID;
}