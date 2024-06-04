package kr.project.sportscenter.level;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LevelServiceImpl implements LevelService {

	@Autowired
	private LevelMapper mapper;
	
	@Override
	public boolean regist(LevelVO vo) {
		return mapper.regist(vo) == 0 ? false : true;
	}

	@Override
	public Map<String, Object> list(LevelVO vo) {
		List<LevelVO> list = mapper.list(vo);
		Map<String, Object> lmap = new HashMap<>();
		lmap.put("list", list);
		return lmap;
	}
}
