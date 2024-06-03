package kr.project.sportscenter.class1;

import java.util.Map;


public interface ClassService {
	Map<String, Object> list(ClassVO vo);
	boolean regist(ClassVO vo);
	
}