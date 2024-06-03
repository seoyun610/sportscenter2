package kr.project.sportscenter.user;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {
	
	int join(UserVO vo);
	
	//로그인 화면
	UserVO login(UserVO vo);
	
	// 아이디 중복체크
	int useridCheck(String userid);
	
	// 이메일 중복체크
	int emailCheck(String email);

}