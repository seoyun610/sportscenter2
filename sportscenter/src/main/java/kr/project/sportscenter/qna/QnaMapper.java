package kr.project.sportscenter.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface QnaMapper {
	int insert(QnaVO vo);
	int count(QnaVO vo);
	List<QnaVO> list(QnaVO vo);
	QnaVO detail(QnaVO vo);
	int increaseReadcnt(int no);
	int update(QnaVO vo);
	int delete(int no);
	int fileDelete(int no);
	

	

}