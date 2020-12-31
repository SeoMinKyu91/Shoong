package com.kosmo.shoong.service.gallery;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class GalleryDTO {
	private String diaryImgCode;
	private String diaryCode;
	private String diaryImgName;
	private Date diaryImgDate;
	private String diaryImgTitle;
	private String diaryImgContent;
	private String userId;
	
}
