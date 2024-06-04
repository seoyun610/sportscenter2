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
	public UserVO findId(String username, String birth, String hp) {
		UserVO vo = new UserVO();
		vo.setUsername(username);;
		vo.setBirth(birth);
		vo.setHp(hp);
		return mapper.findId(vo);
	}
	
	//비밀번호 찾기 
	@Override
	public UserVO findPassword(String userid, String birth, String hp) {
		UserVO vo = new UserVO();
		vo.setUserid(userid);;
		vo.setBirth(birth);
		vo.setHp(hp);
		return mapper.findPassword(vo);
		}
	
	@Override
	public UserVO detail(UserVO vo) {
		return mapper.detail(vo);
	}

	@Override
	public int update(UserVO vo) {
		return mapper.update(vo);
	}
	
}
