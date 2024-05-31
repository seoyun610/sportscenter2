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
		vo.setSubtype(0);
		vo.setClassyear(1999);
		vo.setClassmonth(1);
		vo.setClassname("asdf");
		vo.setClasslevel(1);
		vo.setClasstime(1);
		vo.setClassdate("asdf"); 
		vo.setClassprice(1);
		vo.setClasslimit(1);
		vo.setClasscnt(1);
		mapper.regist(vo);
	}

}