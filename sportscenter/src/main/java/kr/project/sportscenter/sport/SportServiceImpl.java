package kr.project.sportscenter.sport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SportServiceImpl implements SportService {

	@Autowired
	private SportMapper mapper;
	
	@Override
	public boolean regist(SportVO vo) {
		return mapper.regist(vo) == 0 ? false : true;
	}

	@Override
	public Map<String, Object> list(SportVO vo) {
		List<SportVO> list = mapper.list(vo);
		Map<String, Object> smap = new HashMap<>();
		smap.put("list", list);
		return smap;
	}

}
