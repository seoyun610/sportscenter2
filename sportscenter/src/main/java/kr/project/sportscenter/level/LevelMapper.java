package kr.project.sportscenter.level;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LevelMapper {
	int regist(LevelVO vo);
	List<LevelVO> list(LevelVO vo);
}
