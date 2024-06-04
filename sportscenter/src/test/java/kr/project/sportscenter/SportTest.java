package kr.project.sportscenter;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.project.sportscenter.sport.SportMapper;
import kr.project.sportscenter.sport.SportVO;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {config.MvcConfig.class})
@WebAppConfiguration
public class SportTest {
	@Autowired
	SportMapper mapper;
	
	@Test
	public void regist() {
		SportVO vo = new SportVO();
		vo.setSportid(99);
		vo.setSporttxt("종목");
		mapper.regist(vo);
		vo.setSportid(1);
		vo.setSporttxt("수영");
		mapper.regist(vo);
		vo.setSportid(2);
		vo.setSporttxt("헬스");
		mapper.regist(vo);
		vo.setSportid(3);
		vo.setSporttxt("스쿼시");
		mapper.regist(vo);
		vo.setSportid(4);
		vo.setSporttxt("줌바댄스");
		mapper.regist(vo);
		vo.setSportid(5);
		vo.setSporttxt("아쿠아로빅");
		mapper.regist(vo);
		vo.setSportid(6);
		vo.setSporttxt("스피닝");
		mapper.regist(vo);
		vo.setSportid(7);
		vo.setSporttxt("필라테스");
		mapper.regist(vo);
		vo.setSportid(8);
		vo.setSporttxt("점핑 트램플린");
		mapper.regist(vo);
		vo.setSportid(9);
		vo.setSporttxt("플라잉 요가");
		mapper.regist(vo);		
	}
}
