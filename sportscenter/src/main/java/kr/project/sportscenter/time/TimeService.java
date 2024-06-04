package kr.project.sportscenter.time;

import java.util.Map;

public interface TimeService {
	boolean regist(TimeVO vo);
	Map<String, Object> list(TimeVO vo);
}
