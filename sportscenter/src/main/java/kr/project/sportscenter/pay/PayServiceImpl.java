package kr.project.sportscenter.pay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.project.sportscenter.class1.ClassMapper;
import kr.project.sportscenter.notice.NoticeVO;

@Service 
public class PayServiceImpl implements PayService {

	@Autowired
	private PayMapper mapper;
	
	@Override
	public Map<String, Object> list(PayVO vo) {
		 Map<String, Object> map = new HashMap<>();
		 List<PayVO> list = mapper.list(vo);
	     map.put("list", list);
	     return map;
	}

	@Override
	public boolean regist(PayVO vo) {
		return mapper.regist(vo) == 0 ? false : true;
	}

	@Override
	public boolean exists(PayVO vo) {
		return mapper.exists(vo) == 0 ? false : true;
	}

	@Override
	public boolean update(PayVO vo) {
		return mapper.update(vo) == 0 ? false : true;
	}

	@Override
	public Map<String, Object> courseList(PayVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<PayVO> list = mapper.courseList(param); // 목록
        
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
	public boolean addAll(List<PayVO> list) {
		return mapper.addAll(list) > 0 ? true : false;
	}

}