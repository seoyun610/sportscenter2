package kr.project.sportscenter.class1;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ClassMapper {
	int count(ClassVO vo);
	List<ClassVO> list(ClassVO vo);
	ClassVO select(int classid);
	ClassVO detail(ClassVO vo); // 이건 어디서 쓰는거지??
	int regist(ClassVO vo);
	int registAll(List<ClassVO> list);
	int modify(ClassVO vo);
	int delete(int classid);
}