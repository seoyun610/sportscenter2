package kr.project.sportscenter.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper mapper;

	@Override
	public boolean join(UserVO vo) {
		return mapper.join(vo) == 0 ? false : true;
	}

	@Override
	public UserVO login(UserVO vo) {
		return mapper.login(vo);
	}

	@Override
	public int useridCheck(String userid) {
		return mapper.useridCheck(userid);
	}

	@Override
	public int emailCheck(String email) {
		return mapper.emailCheck(email);
	}

}
