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
	UserVO findId(UserVO vo);
	
	// 비밀번호 찾기 
	UserVO findPassword(UserVO vo); 
	
	
	//비밀번호 업데이트 
	UserVO updatePassword(String pwd);
	
	// 회원정보 조회
	UserVO detail(UserVO vo);
	
	// 회원정보 수정
	int update(UserVO vo);

	
}