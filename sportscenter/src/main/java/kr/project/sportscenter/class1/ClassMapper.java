package kr.project.sportscenter.class1;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ClassMapper {

	int count(ClassVO vo);
	List<ClassVO> list(ClassVO vo);
	ClassVO detail(ClassVO vo);
}