package kr.project.sportscenter.time;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TimeServiceImpl implements TimeService {

	@Autowired
	TimeMapper mapper;
	
	@Override
	public boolean regist(TimeVO vo) {
		return mapper.regist(vo) == 0 ? false : true;
	}

	@Override
	public Map<String, Object> list(TimeVO vo) {
		List<TimeVO> list = mapper.list(vo);
		Map<String, Object> tmap = new HashMap<>();
		tmap.put("list", list);
		return tmap;
	}

}
