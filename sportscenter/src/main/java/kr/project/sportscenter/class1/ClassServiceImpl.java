package kr.project.sportscenter.class1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service 
public class ClassServiceImpl implements ClassService {

	@Autowired
	private ClassMapper mapper;
	
	@Override
	public boolean regist(ClassVO vo) {
		
		return mapper.regist(vo) == 0 ? false : true;
	}

}