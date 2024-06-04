package kr.project.sportscenter.level;

import java.util.Map;

public interface LevelService {
	boolean regist(LevelVO vo);
	Map<String, Object> list(LevelVO vo);
}
