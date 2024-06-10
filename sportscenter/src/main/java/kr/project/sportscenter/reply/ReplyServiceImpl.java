package kr.project.sportscenter.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.project.sportscenter.qna.QnaMapper;
import kr.project.sportscenter.qna.QnaVO;


@Service 
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper mapper;
	
	@Autowired
	QnaMapper qmapper; 
	
	@Override
	public Map<String, Object> index(ReplyVO vo, QnaVO qvo) {
		List<QnaVO> qlist = qmapper.list(qvo); 
		List<ReplyVO> list = mapper.list(vo); // 목록
		Map map = new HashMap();
		map.put("list", list); // 모델에 직접 넣어줘도 됨
		map.put("qlist", qlist); 
		return map;

	}

	@Override
	public int insert(ReplyVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int delete(ReplyVO vo) {
		return mapper.delete(vo.getReplyid());
	}

	@Override
	public List<ReplyVO> all(ReplyVO vo) {
		return mapper.all(vo);
	}

	@Override
	public Map<String, Object> vindex(ReplyVO vo) {
		List<ReplyVO> list = mapper.list(vo); // 목록
		Map map = new HashMap();
		map.put("list", list); // 모델에 직접 넣어줘도 됨
		return map;
	}

	@Override
	public Map<String, Object> qindex(QnaVO qvo) {
		List<QnaVO> qlist = qmapper.list(qvo);
		Map map = new HashMap<>();
		map.put("qlist", qlist); 
		return map;
	}
}