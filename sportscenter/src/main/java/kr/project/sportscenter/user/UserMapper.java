package kr.project.sportscenter.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	
	int regist(UserVO vo);

}