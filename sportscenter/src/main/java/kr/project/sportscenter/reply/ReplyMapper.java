package kr.project.sportscenter.reply;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {
	
	int regist(ReplyVO vo);

}