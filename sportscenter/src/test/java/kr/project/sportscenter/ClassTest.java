package kr.project.sportscenter;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.project.sportscenter.class1.ClassMapper;
import kr.project.sportscenter.class1.ClassVO;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {config.MvcConfig.class})
@WebAppConfiguration
public class ClassTest { 
	
	@Autowired
	ClassMapper mapper;
	
	@Test 
	public void regist() {
		ClassVO vo = new ClassVO();
		vo.setSubtype(1);
		vo.setClassyear(2024);
		vo.setClassmonth(6);
		vo.setClassname("수영 13시 고급");
		vo.setClasslevel(3);
		vo.setClasstime(13);
		vo.setClassday("1^2^3^4^5"); 
		vo.setClassprice(70000);
		vo.setClasslimit(30);
		vo.setClasscnt(28);
		mapper.regist(vo);
	}

}