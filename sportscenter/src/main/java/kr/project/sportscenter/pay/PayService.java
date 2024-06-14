package kr.project.sportscenter.pay;

import java.util.Map;


public interface PayService {
	boolean regist(PayVO vo);
	Map<String, Object> list(PayVO vo);
	boolean exists(PayVO vo);
	boolean update(PayVO vo);
	Map<String, Object> courseList(PayVO vo);
}