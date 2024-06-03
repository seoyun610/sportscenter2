package kr.project.sportscenter.user;

public interface UserService {
	
	boolean join(UserVO vo); 
	
	UserVO login(UserVO vo);
	
	int useridCheck(String userid);
	
	int emailCheck(String email);
	 

}