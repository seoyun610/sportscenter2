package kr.project.sportscenter;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.project.sportscenter.user.UserMapper;
import kr.project.sportscenter.user.UserVO;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {config.MvcConfig.class})
@WebAppConfiguration
public class UserTest {
	
	@Autowired
	UserMapper mapper;
	
	@Test
	public void regist() {
		UserVO vo = new UserVO();
		vo.setUserid("test1234"); 
		vo.setUsername("테스터3");
		vo.setPwd("12345");
		vo.setHp("010-1234-4567");
		vo.setAddr("서울시 마포구 중앙남로7길");
		vo.setAddr2("103호");
		vo.setBirth("020101");
		vo.setGender(0);
		vo.setEmail("test3@gmail.com");
		
		mapper.join(vo);
	}

}