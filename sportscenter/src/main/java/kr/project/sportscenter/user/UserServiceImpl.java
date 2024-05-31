package kr.project.sportscenter.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service 
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public boolean regist(UserVO vo) {
		
		return mapper.regist(vo) == 0 ? false : true;
	}

}