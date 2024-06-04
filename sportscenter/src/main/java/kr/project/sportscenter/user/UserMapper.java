package kr.project.sportscenter.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserMapper {
	
	int join(UserVO vo);
	
	//로그인 화면
	UserVO login(UserVO vo);
	
	// 아이디 중복체크
	int useridCheck(String userid);
	
	// 이메일 중복체크
	int emailCheck(String email);
	
	// 아이디 찾기 
	int findId(@Param("username")String username,@Param("birth") String birth, @Param("hp") String hp);
	
	// 비밀번호 찾기 
	int findPassword(@Param("userId")String userId, @Param("birth") String birth, @Param("hp") String hp); 
	
	
	//비밀번호 업데이트 
	int updatePassword(@Param("pwd") String pwd); 
}