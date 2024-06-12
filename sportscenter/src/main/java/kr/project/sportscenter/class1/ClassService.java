package kr.project.sportscenter.class1;

import java.util.List;
import java.util.Map;


public interface ClassService {
	Map<String, Object> list(ClassVO vo);
	ClassVO select(int classid);
	boolean regist(ClassVO vo);
	boolean modify(ClassVO vo);
}