package kr.project.sportscenter.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {
	int insert(NoticeVO vo);
	int count(NoticeVO vo);
	List<NoticeVO> list(NoticeVO vo);
	NoticeVO detail(NoticeVO vo);
	int increaseReadcnt(int noticeid);
	int update(NoticeVO vo);
	int delete(int noticeid);
	int fileDelete(int noticeid);

}