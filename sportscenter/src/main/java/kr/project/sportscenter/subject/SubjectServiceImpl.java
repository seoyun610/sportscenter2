package kr.project.sportscenter.subject;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.project.sportscenter.notice.NoticeVO;


@Service 
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectMapper mapper;
	

	@Override
	public int insert(SubjectVO vo, HttpSession sess, MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
	        // 파일명
	        String org = file.getOriginalFilename();
	        String ext = org.substring(org.lastIndexOf("."));
	        String real = System.currentTimeMillis() + ext;

	        String path = request.getServletContext().getRealPath("/upload/subject/") + real;
	        System.out.println(path);

	        File dir = new File(request.getServletContext().getRealPath("/upload/subject/"));
	        if (!dir.exists()) {
	            dir.mkdirs();
	        }

	        try {
	            file.transferTo(new File(path));
	        } catch (Exception e) {
	            e.printStackTrace(); 
	            return 0;
	        }

	        vo.setSubjectfilename_org(org);
	        vo.setSubjectfilename_real(real);
	    }

	    int r = mapper.insert(vo);
	    return r;
	}

	@Override
	public int update(SubjectVO vo, MultipartFile file, HttpServletRequest request) {
		if ("ok".equals(request.getParameter("fileDelete"))) {
			SubjectVO data = mapper.detail(vo);
			mapper.fileDelete(vo.getSubjectid());
			File f = new File(request.getRealPath("/upload/subject/")+data.getSubjectfilename_real());
			f.delete();
		}
		if (!file.isEmpty()) {
	        // 파일명
	        String org = file.getOriginalFilename();
	        String ext = org.substring(org.lastIndexOf("."));
	        String real = System.currentTimeMillis() + ext;

	        // 파일 저장 경로
	        String path = request.getServletContext().getRealPath("/upload/subject/") + real;
	        System.out.println(path);

	        // 디렉토리 생성
	        File dir = new File(request.getServletContext().getRealPath("/upload/subject/"));
	        if (!dir.exists()) {
	            dir.mkdirs();
	        }

	        // 파일 저장
	        try {
	            file.transferTo(new File(path));
	        } catch (Exception e) {
	            e.printStackTrace(); 
	            return 0;
	        }

	        vo.setSubjectfilename_org(org);
	        vo.setSubjectfilename_real(real);
	    }

	    int r = mapper.update(vo);
	    return r;
	}

	@Override
	public int delete(SubjectVO vo, HttpServletRequest request) {
		SubjectVO data = mapper.detail(vo);
		if (data.getSubjectfilename_real() != null && !"".equals(data.getSubjectfilename_real())) {
			File f = new File(request.getRealPath("/upload/subject/")+data.getSubjectfilename_real());
			f.delete();
		}
		return mapper.delete(vo.getSubjectid());
	}

	@Override
	public Map<String, Object> list(SubjectVO vo) {
        List<SubjectVO> list = mapper.list(vo); // 목록
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        
		return map;
        
    
	}

	@Override
	public SubjectVO detail(SubjectVO vo, boolean isUpdate) {
		if (isUpdate) {
			mapper.increaseReadcnt(vo.getSubjectid());
		}
		SubjectVO data = mapper.detail(vo);
		return data;
	}

}