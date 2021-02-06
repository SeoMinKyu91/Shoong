package com.kosmo.shoong.service.badge;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 BADGE_ID                                  NOT NULL NUMBER
 BADGE_NAME                                         NVARCHAR2(30)
 BADGE_REQUIREMENT                                  VARCHAR2(30)
 BADGE_CATEGORY                                     VARCHAR2(30)
 BADGE_THUMBNAIL                                    NVARCHAR2(30)
 */
@Setter
@Getter
@ToString
public class BadgeDTO {
	private int badgeId;
	private String badgeName;
	private String badgeRequirement;
	private String badgeCategory;
	private String badgeThumbnail;
	
	private String userId;

}
