package kr.project.sportscenter;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.project.sportscenter.time.TimeMapper;
import kr.project.sportscenter.time.TimeVO;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {config.MvcConfig.class})
@WebAppConfiguration
public class TimeTest {
	
	@Autowired
	TimeMapper mapper;
	
	@Test
	public void regist() {
		TimeVO vo = new TimeVO();
		vo.setTimeid(1);
		vo.setTimetxt("자유");
		mapper.regist(vo);
		for(int i=6; i<=9; i++) {
			vo.setTimeid(i);
			vo.setTimetxt("0"+i+"시");
			mapper.regist(vo);
		}
		for(int i=10; i<=21; i++) {
			vo.setTimeid(i);
			vo.setTimetxt(i+"시");
			mapper.regist(vo);
		}
		vo.setTimeid(99);
		vo.setTimetxt("시간");
		mapper.regist(vo);
	}
}
