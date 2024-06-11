package kr.project.sportscenter.reply;

import java.util.List;
import java.util.Map;

import kr.project.sportscenter.qna.QnaVO;

public interface ReplyService {
	Map<String, Object> vindex(ReplyVO vo);
	Map<String, Object> qindex(QnaVO qvo);
	Map<String, Object> index(ReplyVO vo, QnaVO qvo);
	int insert(ReplyVO vo);
	int delete(ReplyVO vo);
	List<ReplyVO> all(ReplyVO vo);
	
}