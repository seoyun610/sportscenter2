package kr.project.sportscenter.user;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface UserService {
	
	boolean join(UserVO vo); 
	
	UserVO login(UserVO vo);
	
	int useridCheck(String userid);
	
	int emailCheck(String email);

	UserVO find(UserVO vo);
	
	int update(UserVO vo);
	
	int verifyPassword(UserVO vo);

	boolean updatePassword(String userid, String newPwd);
	
	// 수강 내역 확인 
	List<UserVO> classView(UserVO vo);
	List<UserVO> retakeClass(UserVO vo);
	List<UserVO> classHistory(UserVO vo);
	Map<String, Object> findUser(UserVO vo);

}