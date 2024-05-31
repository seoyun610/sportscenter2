package kr.project.sportscenter.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service 
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper mapper;
	
	@Override
	public boolean regist(QnaVO vo) {
		
		return mapper.regist(vo) == 0 ? false : true;
	}

}