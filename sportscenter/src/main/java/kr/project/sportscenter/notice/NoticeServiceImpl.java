package kr.project.sportscenter.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service 
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public boolean regist(NoticeVO vo) {
		
		return mapper.regist(vo) == 0 ? false : true;
	}

}