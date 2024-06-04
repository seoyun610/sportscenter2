package kr.project.sportscenter;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.project.sportscenter.level.LevelMapper;
import kr.project.sportscenter.level.LevelVO;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {config.MvcConfig.class})
@WebAppConfiguration
public class LevelTest {

	@Autowired
	LevelMapper mapper;
	
	@Test
	public void regist() {
		LevelVO vo = new LevelVO();
		vo.setLevelid(1);
		vo.setLeveltxt("초급");
		mapper.regist(vo);
		vo.setLevelid(2);
		vo.setLeveltxt("중급");
		mapper.regist(vo);
		vo.setLevelid(3);
		vo.setLeveltxt("고급");
		mapper.regist(vo);
		vo.setLevelid(4);
		vo.setLeveltxt("연수");
		mapper.regist(vo);
		vo.setLevelid(5);
		vo.setLeveltxt("FREE");
		mapper.regist(vo);
		vo.setLevelid(99);
		vo.setLeveltxt("등급");
		mapper.regist(vo);
	}
}
