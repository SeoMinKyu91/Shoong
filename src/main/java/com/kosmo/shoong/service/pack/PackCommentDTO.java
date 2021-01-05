package com.kosmo.shoong.service.pack;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PackCommentDTO {
	
	private String no;
	private String content;
	private java.sql.Date postDate;
	private String id;
	private String commentCount;
	private List<MemoCommentDTO> comments;
	
}
