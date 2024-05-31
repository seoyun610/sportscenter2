package kr.project.sportscenter;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.project.sportscenter.notice.NoticeMapper;
import kr.project.sportscenter.notice.NoticeVO;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {config.MvcConfig.class})
@WebAppConfiguration
public class NoticeTest {
	
	@Autowired
	NoticeMapper mapper;
	
	@Test
	public void regist() { 
		NoticeVO vo = new NoticeVO();
		vo.setNoticetitle("공지사항 제목2");
		vo.setNoticecontent("공지사항 이야기2");
		vo.setNoticeregcnt(0); 
		mapper.regist(vo);
	}

}