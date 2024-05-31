package kr.project.sportscenter.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service 
public class PayServiceImpl implements PayService {

	@Autowired
	private PayMapper mapper;
	
	@Override
	public boolean regist(PayVO vo) {
		
		return mapper.regist(vo) == 0 ? false : true;
	}

}