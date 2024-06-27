package kr.project.sportscenter.qna;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.project.sportscenter.reply.ReplyMapper;



@Service 
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper mapper;

	@Override
	public int insert(QnaVO vo, MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			// 파일명
			String org = file.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = System.currentTimeMillis()+ext;
			// 파일저장
			String path = request.getRealPath("/upload/qna/")+real;
			try {
				file.transferTo(new File(path));
			} catch (Exception e) {}
			vo.setQnafilename_org(org);
			vo.setQnafilename_real(real);
		}
		int r = mapper.insert(vo);
		return r;
	}

	@Override
	public QnaVO detail(QnaVO vo, boolean isUpdate) {
		if (isUpdate) {
			mapper.increaseReadcnt(vo.getQnaid());
		}
		QnaVO data = mapper.detail(vo);
		return data;
	}

	@Override
	public int update(QnaVO vo, MultipartFile file, HttpServletRequest request) {
		if ("ok".equals(request.getParameter("fileDelete"))) {
			QnaVO data = mapper.detail(vo);
			mapper.fileDelete(vo.getQnaid());
			File f = new File(request.getRealPath("/upload/qna/")+data.getQnafilename_real());
			f.delete();
		}
		if (!file.isEmpty()) {
			// 파일명
			String org = file.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = System.currentTimeMillis()+ext;
			// 파일저장
			String path = request.getRealPath("/upload/qna/")+real;
			try {
				file.transferTo(new File(path));
			} catch (Exception e) {}
			vo.setQnafilename_org(org);
			vo.setQnafilename_real(real);
		}
		int r = mapper.update(vo);
		return r;
	}
/*
	@Override
	public int reply(QnaVO vo, MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			// 파일명
			String org = file.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = System.currentTimeMillis()+ext;
			// 파일저장
			String path = request.getRealPath("/upload/board/")+real;
			try {
				file.transferTo(new File(path));
			} catch (Exception e) {}
			vo.setQnafilename_org(org);
			vo.setQnafilename_real(real);
		}
		int r = mapper.insert(vo);
		return r;
	
	}
*/
	@Override
	public int delete(QnaVO vo, HttpServletRequest request) {
		QnaVO data = mapper.detail(vo);
		if (data.getQnafilename_real() != null && !"".equals(data.getQnafilename_real())) {
			File f = new File(request.getRealPath("/upload/qna/")+data.getQnafilename_real());
			f.delete();
		}
		return mapper.delete(vo.getQnaid());
	}
		

	@Override
	public Map<String, Object> list(QnaVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<QnaVO> list = mapper.list(param); // 목록
        
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

}