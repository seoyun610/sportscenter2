package kr.project.sportscenter.reply;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyVO {
	private int replyid;
	private String replycontent;
	private Timestamp regdate;
	private int qnaid;
	private int adminnum;
	private String adminname;

}