package kr.project.sportscenter.subject;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SubjectVO {
	private int subjectid;
	private String subjecttype;
	private String subjectcontent;
	private Timestamp subjectregdate;
	private int subjectregnct;
	private String subjectfilename_org;
	private String subjectfilename_real;
	private int adminno;
	
	

}