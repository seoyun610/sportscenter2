package kr.project.sportscenter.pay;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayMapper {
	int regist(PayVO vo);
	List<PayVO> list(PayVO vo);
	int exists(PayVO vo);
	int update(PayVO vo);
}