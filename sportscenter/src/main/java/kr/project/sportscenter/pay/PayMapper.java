package kr.project.sportscenter.pay;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayMapper {
	int regist(PayVO vo);
	List<PayVO> list(PayVO vo);
	int exists(PayVO vo);
	int update(PayVO vo);
	List<PayVO> courseList(PayVO vo);
	int count(PayVO vo);
	int addAll(List<PayVO> list);
	int updatePaystate(PayVO vo);
	int courseModify(PayVO vo);
	PayVO clist(int payid);
	PayVO select(int classid);
}