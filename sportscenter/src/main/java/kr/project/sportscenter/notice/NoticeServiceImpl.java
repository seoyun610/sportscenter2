package kr.project.sportscenter.notice;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service 
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	
	@Override
	public int insert(NoticeVO vo, MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
	        // 파일명
	        String org = file.getOriginalFilename();
	        String ext = org.substring(org.lastIndexOf("."));
	        String real = System.currentTimeMillis() + ext;

	        String path = request.getServletContext().getRealPath("/upload/notice/") + real;
	        System.out.println(path);

	        File dir = new File(request.getServletContext().getRealPath("/upload/notice/"));
	        if (!dir.exists()) {
	            dir.mkdirs();
	        }

	        try {
	            file.transferTo(new File(path));
	        } catch (Exception e) {
	            e.printStackTrace();
	            return 0;
	        }

	        vo.setNoticefilename_org(org);
	        vo.setNoticefilename_real(real);
	    }

	    int r = mapper.insert(vo);
	    return r;
	}
	
	@Override
	public int update(NoticeVO vo, MultipartFile file, HttpServletRequest request) {
		if ("ok".equals(request.getParameter("fileDelete"))) {
			NoticeVO data = mapper.detail(vo);
			mapper.fileDelete(vo.getNoticeid());
			File f = new File(request.getRealPath("/upload/notice/")+data.getNoticefilename_real());
			f.delete();
		}
		if (!file.isEmpty()) {
	        // 파일명
	        String org = file.getOriginalFilename();
	        String ext = org.substring(org.lastIndexOf("."));
	        String real = System.currentTimeMillis() + ext;

	        // 파일 저장 경로
	        String path = request.getServletContext().getRealPath("/upload/notice/") + real;
	        System.out.println(path);

	        // 디렉토리 생성
	        File dir = new File(request.getServletContext().getRealPath("/upload/notice/"));
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

	        vo.setNoticefilename_org(org);
	        vo.setNoticefilename_real(real);
	    }

	    int r = mapper.update(vo);
	    return r;
	}

	@Override
	public int delete(NoticeVO vo, HttpServletRequest request) {
		NoticeVO data = mapper.detail(vo);
		if (data.getNoticefilename_real() != null && !"".equals(data.getNoticefilename_real())) {
			File f = new File(request.getRealPath("/upload/notice/")+data.getNoticefilename_real());
			f.delete();
		}
		return mapper.delete(vo.getNoticeid());
	}
	
	@Override
	public int reply(NoticeVO vo, MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			// 파일명
			String org = file.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = System.currentTimeMillis()+ext;
			// 파일저장
			String path = request.getRealPath("/upload/notice/")+real;
			try {
				file.transferTo(new File(path));
			} catch (Exception e) {}
			vo.setNoticefilename_org(org);
			vo.setNoticefilename_real(real);
		}
		int r = mapper.insert(vo);
		return r;
	}

	@Override
	public Map<String, Object> list(NoticeVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<NoticeVO> list = mapper.list(param); // 목록
        
        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", list);
        
        // 하단에 페이징처리
        int endPage = (int)(Math.ceil(param.getPage()/10.0)*10);
        int startPage = endPage - 9;
        if (endPage > totalPage) endPage = totalPage;
        boolean isPrev = startPage > 1;
        boolean isNext = endPage < totalPage;
        map.put("endPage", endPage);
        map.put("startPage", startPage);
        map.put("isPrev", isPrev);
		map.put("isNext", isNext);
		return map;
	}

	@Override
	public NoticeVO detail(NoticeVO vo, boolean isUpdate) {
		if (isUpdate) {
			mapper.increaseReadcnt(vo.getNoticeid());
		}
		NoticeVO data = mapper.detail(vo);
		return data;
	}

}