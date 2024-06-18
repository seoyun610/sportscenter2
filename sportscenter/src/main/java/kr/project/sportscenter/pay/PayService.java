package kr.project.sportscenter.pay;

import java.util.List;
import java.util.Map;

import kr.project.sportscenter.user.UserVO;


public interface PayService {
	boolean regist(PayVO vo);
	Map<String, Object> list(PayVO vo);
	boolean exists(PayVO vo);
	boolean update(PayVO vo);
	Map<String, Object> courseList(PayVO vo);
	boolean addAll(List<PayVO> list);
	boolean updatePaystate(PayVO vo);
}