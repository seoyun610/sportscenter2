package kr.project.sportscenter.time;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TimeMapper {
	int regist(TimeVO vo);
	List<TimeVO> list(TimeVO vo);
}
