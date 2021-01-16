package com.kosmo.shoong.admin.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReportAdminDTO {
	
	private String reportID;
	private String userID;
	private String reportTargetID;
	private String reportCategory;
	private java.sql.Date reportDate;
	private String reportReason;
	
	
	public String getReportID() {
		return reportID;
	}
	public void setReportID(String reportID) {
		this.reportID = reportID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getReportTargetID() {
		return reportTargetID;
	}
	public void setReportTargetID(String reportTargetID) {
		this.reportTargetID = reportTargetID;
	}
	public String getReportCategory() {
		return reportCategory;
	}
	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}
	public java.sql.Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(java.sql.Date reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportReason() {
		return reportReason;
	}
	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}
	
	
}
