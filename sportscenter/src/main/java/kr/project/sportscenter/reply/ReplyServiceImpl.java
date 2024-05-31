package kr.project.sportscenter.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service 
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public boolean regist(ReplyVO vo) {
		
		return mapper.regist(vo) == 0 ? false : true;
	}

}