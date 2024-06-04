package kr.project.sportscenter.notice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface NoticeService {
	
	int insert(NoticeVO vo, HttpSession sess, MultipartFile file, HttpServletRequest request);
	int reply(NoticeVO vo, MultipartFile file, HttpServletRequest request);
	int update(NoticeVO vo, MultipartFile file, HttpServletRequest request);
	int delete(NoticeVO vo, HttpServletRequest request);
	Map<String, Object> list(NoticeVO vo);
	NoticeVO detail(NoticeVO vo, boolean isUpdate);

}