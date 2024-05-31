package kr.project.sportscenter.notice;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {
	
	int regist(NoticeVO vo);

}