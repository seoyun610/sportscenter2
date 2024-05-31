package kr.project.sportscenter.subject;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SubjectMapper {
	
	int regist(SubjectVO vo);

}