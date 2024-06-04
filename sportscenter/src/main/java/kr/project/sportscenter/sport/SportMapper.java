package kr.project.sportscenter.sport;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SportMapper {
	int regist(SportVO vo);
	List<SportVO> list(SportVO vo);
}
