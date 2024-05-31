package kr.project.sportscenter.subject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service 
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectMapper mapper;
	
	@Override
	public boolean regist(SubjectVO vo) {
		
		return mapper.regist(vo) == 0 ? false : true;
	}

}