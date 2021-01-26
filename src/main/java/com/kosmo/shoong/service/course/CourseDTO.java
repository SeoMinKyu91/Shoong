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
	//@SerializedName("")
	private String courseID;
	private String courseName;
	private String courseIntro;
	private String courseThumbnail;
	private String courseTime;
	private String courseLength;
	private String courseRegion;
	private String courseTag;
	private Date courseRegiDate;
	
	private String userId;
	private String courseCateID;
}