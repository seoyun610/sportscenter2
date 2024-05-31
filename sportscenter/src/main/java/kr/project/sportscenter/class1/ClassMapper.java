package kr.project.sportscenter.class1;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ClassMapper {
	
	int regist(ClassVO vo);

}