package kr.project.sportscenter.pay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service 
public class PayServiceImpl implements PayService {

	@Autowired
	private PayMapper mapper;
	
	@Override
	public Map<String, Object> list(PayVO vo) {
		 Map<String, Object> map = new HashMap<>();
		 List<PayVO> list = mapper.list(vo);
	     map.put("list", list);
	     return map;
	}

	@Override
	public boolean regist(PayVO vo) {
		return mapper.regist(vo) == 0 ? false : true;
	}

	@Override
	public boolean exists(PayVO vo) {
		return mapper.exists(vo) == 0 ? false : true;
	}

	@Override
	public boolean update(PayVO vo) {
		return mapper.update(vo) == 0 ? false : true;
	}

}