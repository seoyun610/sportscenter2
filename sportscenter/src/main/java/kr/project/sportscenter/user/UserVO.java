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
	private int zipcode;
	
	private int payid;	
	private int paystate;
	private int cancelstate;
	private int refundstate;
	private int price;
	private String paymethod;
	
    private int classid;
    private int classyear;
    private int classmonth;
    private String classname;
    private int classprice;
    
    public String getFormattedClassdate() {
    	return String.format("%04d-%02d", classyear, classmonth);
    }
	private String classstatus;
	private String searchWord;
	private String searchMonth;
	private String searchType;
}