package kr.project.sportscenter.reply;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.project.sportscenter.qna.QnaVO;

public interface ReplyService {
//	Map<String, Object> vindex(ReplyVO vo);
//	Map<String, Object> qindex(QnaVO qvo);
	List<ReplyVO> list(ReplyVO vo);
	int insert(ReplyVO vo);
	int delete(ReplyVO vo);
//	List<ReplyVO> all(ReplyVO vo);
	int update(ReplyVO vo);
	ReplyVO detail(ReplyVO vo);
}