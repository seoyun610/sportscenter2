package kr.project.sportscenter.admin;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
	
	int regist(AdminVO vo);
	
	AdminVO adminLogin(AdminVO vo); 

}