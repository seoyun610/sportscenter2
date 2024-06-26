package kr.project.sportscenter.user;

import java.util.List;

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
	
	//비밀번호 업데이트 
	boolean updatePassword(UserVO vo);
	
	// 회원정보 조회
	UserVO find(UserVO vo);
	
	// 회원정보 수정
	int update(UserVO vo);
	
	//비밀번호 확인
	int verifyPassword(UserVO vo);

	List<UserVO> classView(UserVO vo);
	List<UserVO> retakeClass(UserVO vo);
	List<UserVO> classHistory(UserVO vo);
	
	List<UserVO> findUser(UserVO vo);
	List<UserVO> classDetailUser(UserVO vo);
	int count(UserVO vo);
}