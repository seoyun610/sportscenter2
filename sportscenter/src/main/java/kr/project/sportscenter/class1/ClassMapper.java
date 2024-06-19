package kr.project.sportscenter.class1;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface ClassMapper {
	int count(ClassVO vo);
	List<ClassVO> list(ClassVO vo);
//	ClassVO select(ClassVO vo);
	int regist(ClassVO vo);
	int registAll(List<ClassVO> list);
	int modify(ClassVO vo);
	int delete(int classid);
	int updateCnt(ClassVO vo);
	List<ClassVO> cmodify(@Param("classid") int classid, @Param("classyear") int classyear, @Param("classmonth") int classmonth);
	List<ClassVO> foroff(@Param("classyear") int classyear, @Param("classmonth") int classmonth);
}