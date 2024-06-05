package kr.project.sportscenter.subject;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SubjectMapper {
	int insert(SubjectVO vo);
	int count(SubjectVO vo);
	List<SubjectVO> list(SubjectVO vo);
	SubjectVO detail(SubjectVO vo);
	int increaseReadcnt(int subjectid);
	int update(SubjectVO vo);
	int delete(int SubjectVO);
	int fileDelete(int SubjectVO);

}