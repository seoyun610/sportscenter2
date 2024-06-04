package kr.project.sportscenter.sport;

import java.util.Map;

public interface SportService {
	boolean regist(SportVO vo);
	Map<String, Object> list(SportVO vo);
}
