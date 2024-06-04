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
	
	//아이디 찾기 
	@Override
	public int findId(String usernaem, String birth, String hp) {
		return mapper.findId(usernaem, birth, hp);
	}
	
	//비밀번호 찾기 
	@Override
	public int findPassword(String userid, String birth, String hp) {
		return mapper.findPassword(userid, birth, hp);
		}
	
}
