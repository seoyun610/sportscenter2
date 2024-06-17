package kr.project.sportscenter.class1;

import java.util.List;
import java.util.Map;

public interface ClassService {
	Map<String, Object> list(ClassVO vo);
	ClassVO select(ClassVO vo);
	boolean regist(ClassVO vo);
	//boolean registAll(Map<String, Object> map);
	boolean modify(ClassVO vo);
	boolean delete(int classid);
	boolean registAll(List<ClassVO> list);
}