package kr.project.sportscenter.subject;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;


public interface SubjectService {
	
	int insert(SubjectVO vo, HttpSession sess, MultipartFile file, HttpServletRequest request);
	int update(SubjectVO vo, MultipartFile file, HttpServletRequest request);
	int delete(SubjectVO vo, HttpServletRequest request);
	Map<String, Object> list(SubjectVO vo);
	SubjectVO detail(SubjectVO vo, boolean isUpdate);; 

}