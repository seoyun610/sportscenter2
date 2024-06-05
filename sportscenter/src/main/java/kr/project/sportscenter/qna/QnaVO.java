package kr.project.sportscenter.qna;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaVO {
	private int qnaid;
	private String qnatitle;
	private String qnacontent;
	private Timestamp qnadate;
	private int qnacnt;
	private int usernum;
	private String qnafilename_org;
	private String qnafilename_real;
	
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값
		
	public QnaVO() {
		this.page = 1;
	}
		
	public int getStartIdx() {
		return (page-1) * 10;
	}	
}