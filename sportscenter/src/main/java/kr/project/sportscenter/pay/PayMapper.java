package kr.project.sportscenter.pay;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayMapper {
	
	int regist(PayVO vo);

}