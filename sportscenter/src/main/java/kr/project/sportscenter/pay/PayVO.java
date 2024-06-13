package kr.project.sportscenter.pay;

import lombok.Data;

@Data
public class PayVO {
	private int classid;
	private int usernum;	
	private int paystate;
	private int cancelstate;
	private int refundstate;
	private int price;
	private String paymethod;
	
	
} 