package kr.project.sportscenter.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import kr.project.sportscenter.notice.NoticeVO;

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
	
	@Override
	public UserVO find(UserVO vo) {
		return mapper.find(vo);
	}

	@Override
	public int update(UserVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int verifyPassword(UserVO vo) {
		return mapper.verifyPassword(vo);
	}
	
	//비밀번호 변경 
	@Override
	public boolean updatePassword(String userid, String newPwd) {
		UserVO vo = new UserVO(); 
		vo.setUserid(userid);
		vo.setPwd(newPwd);
		return mapper.updatePassword(vo);
		
	}

	@Override
	public List<UserVO> classView(UserVO vo) {
	    return mapper.classView(vo);
	}
	
	@Override
	public List<UserVO> retakeClass(UserVO vo) {
	    return mapper.retakeClass(vo);
	}
	
	public List<UserVO> classHistory(UserVO vo) {
		return mapper.classHistory(vo);
	}
	
	public Map<String, Object> findUser(UserVO param){
		int count = mapper.count(param); // 총개수
		List<UserVO> list = mapper.findUser(param);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		
		return map;
	}
	
}
