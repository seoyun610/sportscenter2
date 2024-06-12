package kr.project.sportscenter.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {
	
	int insert(ReplyVO vo);
	int count(ReplyVO vo);
	List<ReplyVO> list(ReplyVO vo);
	int delete(int no);
	//List<ReplyVO> all(ReplyVO vo);
	int update(ReplyVO vo);

}