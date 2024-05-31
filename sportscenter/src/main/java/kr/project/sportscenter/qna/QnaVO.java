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
	

}