package com.kosmo.shoong.service.pack;

import java.io.File;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
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
	
}
