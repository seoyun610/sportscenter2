package kr.project.sportscenter.user;

public interface UserService {
	
	boolean join(UserVO vo); 
	
	UserVO login(UserVO vo);
	
	int useridCheck(String userid);
	
	int emailCheck(String email);
	 
	// 아이디 찾기 
	UserVO findId(String username, String birth, String hp); 
	
	// 비밀번호 찾기 
	UserVO findPassword(String userid, String birth, String hp);
	
	// 회원정보 조회
	UserVO detail(UserVO vo);
	
	// 회원정보 수정
	int update(UserVO vo);
	
	//비밀번호 확인
	int verifyPassword(UserVO vo);

	//비밀번호 업데이트 
	boolean updatePassword(String userid, String newPwd);

}