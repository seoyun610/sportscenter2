package kr.project.sportscenter.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service 
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public boolean regist(AdminVO vo) {
		
		return mapper.regist(vo) == 0 ? false : true;
	}

}