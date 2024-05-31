package kr.project.sportscenter;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.project.sportscenter.admin.AdminMapper;
import kr.project.sportscenter.admin.AdminVO;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {config.MvcConfig.class})
@WebAppConfiguration
public class AdminTest {
	
	@Autowired
	AdminMapper mapper;
	
	@Test
	public void regist() {
		AdminVO vo = new AdminVO();
		vo.setAdminname("관리자1");
		vo.setAdminid("admin1"); 
		vo.setAdminpwd("154");
		mapper.regist(vo);
	}

}