package kr.project.sportscenter.user;


import lombok.Data;

@Data 
public class UserVO {
	private int usernum;
	private String userid;
	private String username;
	private String pwd;
	private String hp;
	private String email;
	private String addr;
	private String addr2;
	private String birth;
	private int gender;
	private String zipcode;

}