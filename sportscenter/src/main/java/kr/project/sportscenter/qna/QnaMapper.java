package kr.project.sportscenter.qna;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QnaMapper {
	
	int regist(QnaVO vo);

}