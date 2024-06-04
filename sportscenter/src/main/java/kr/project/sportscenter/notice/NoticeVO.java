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
	private int adminnum; 

	private String adminname;
	
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값
		
	public NoticeVO() {
		this.page = 1;
	}
		
	public int getStartIdx() {
		return (page-1) * 10;
	}	
}