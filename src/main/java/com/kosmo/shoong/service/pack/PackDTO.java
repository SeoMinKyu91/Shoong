package com.kosmo.shoong.service.pack;

import java.io.File;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

public class PackDTO {
	private String packID;
	private String packName;
	private String packTag;
	private String packActRegion; //팩 활동 지역
	private String packActTime; // 팩 활동 시간
	private String packAge; // 평균 연령
	private String packIntro; //팩 소개글
	private String packThumbnail;
	private String packLat;
	private String packLng;
//private Date packDate; //팩 생성 보류, 나중에 테이블 엮으면 필요.
	public String getPackID() {
		return packID;
	}
	public void setPackID(String packID) {
		this.packID = packID;
	}
	public String getPackName() {
		return packName;
	}
	public void setPackName(String packName) {
		this.packName = packName;
	}
	public String getPackTag() {
		return packTag;
	}
	public void setPackTag(String packTag) {
		this.packTag = packTag;
	}
	public String getPackActRegion() {
		return packActRegion;
	}
	public void setPackActRegion(String packActRegion) {
		this.packActRegion = packActRegion;
	}
	public String getPackActTime() {
		return packActTime;
	}
	public void setPackActTime(String packActTime) {
		this.packActTime = packActTime;
	}
	public String getPackAge() {
		return packAge;
	}
	public void setPackAge(String packAge) {
		this.packAge = packAge;
	}
	public String getPackIntro() {
		return packIntro;
	}
	public void setPackIntro(String packIntro) {
		this.packIntro = packIntro;
	}
	public String getPackThumbnail() {
		return packThumbnail;
	}
	public void setPackThumbnail(String packThumbnail) {
		this.packThumbnail = packThumbnail;
	}
	public String getPackLat() {
		return packLat;
	}
	public void setPackLat(String packLat) {
		this.packLat = packLat;
	}
	public String getPackLng() {
		return packLng;
	}
	public void setPackLng(String packLng) {
		this.packLng = packLng;
	}
	
	
	
}
