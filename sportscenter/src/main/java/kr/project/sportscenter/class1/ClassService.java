package kr.project.sportscenter.class1;

import java.util.List;
import java.util.Map;

public interface ClassService {
	Map<String, Object> list(ClassVO vo);
	ClassVO select(ClassVO vo);
	boolean regist(ClassVO vo);
	boolean modify(ClassVO vo);
	boolean delete(int classid);
	boolean registAll(List<ClassVO> list);
	boolean updateCnt(ClassVO vo);
	List<ClassVO> cmodify(int classid, int classyear, int classmonth);
	List<ClassVO> foroff(int classyear, int classmonth);
}