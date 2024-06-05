package kr.project.sportscenter.qna;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;



public interface QnaService {
	int insert(QnaVO vo, MultipartFile file, HttpServletRequest request);
	QnaVO detail(QnaVO vo, boolean b);
	int update(QnaVO vo, MultipartFile file, HttpServletRequest request);
	int reply(QnaVO vo, MultipartFile file, HttpServletRequest request);
	int delete(QnaVO vo, HttpServletRequest request);
	Map<String, Object> list(QnaVO vo);
}