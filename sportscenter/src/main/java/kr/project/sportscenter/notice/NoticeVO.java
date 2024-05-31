package kr.project.sportscenter.notice;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {  
	private int noticeid;
	private String noticetitle;
	private String noticecontent;
	private Timestamp noticedate;
	private int noticeregcnt;
	private String noticefilename_org;
	private String noticefilename_real;
	private int adminno; 

}