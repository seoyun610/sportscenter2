package kr.project.sportscenter.pay;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface PayService {
	boolean regist(PayVO vo);
	Map<String, Object> list(PayVO vo);
	PayVO list2(PayVO vo);
	Map<String, Object> selectThisMonth(PayVO vo);
	boolean exists(PayVO vo);
	boolean update(PayVO vo);
	Map<String, Object> courseList(PayVO vo);
	boolean addAll(List<PayVO> list);
	boolean courseModify(PayVO vo);
	PayVO clist(int payid);
	boolean offregist(PayVO vo);
	String getToken(String apiKey, String secretKey) throws IOException;
}