package kr.project.sportscenter.class1;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service 
public class ClassServiceImpl implements ClassService {

	@Autowired
	private ClassMapper mapper;
	
	
	@Override
	public Map<String, Object> list(ClassVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<ClassVO> list = mapper.list(param); // 목록
        
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
	public ClassVO select(ClassVO vo) {
		List<ClassVO> list = mapper.list(vo);
		ClassVO cvo = new ClassVO();
		for(ClassVO item : list) {
			cvo = item;
		}
		return cvo;
	}

	
	@Override
	public boolean regist(ClassVO vo) {
		
		return mapper.regist(vo) == 0 ? false : true;
	}


	@Override
	public boolean modify(ClassVO vo) {
		return mapper.modify(vo) > 0 ? true : false;
	}


	@Override
	public boolean delete(int classid) {
		return mapper.delete(classid) > 0 ? true : false;
	}


	@Override
	public boolean registAll(List<ClassVO> list) {
		return mapper.registAll(list) > 0 ? true : false;
	}

	@Override
	public List<ClassVO> cmodify(int classid, int classyear, int classmonth) {
		return mapper.cmodify(classid, classyear, classmonth);
	}
	
	@Override
	public boolean updateCnt(ClassVO vo) {
		return mapper.updateCnt(vo) > 0 ? true : false;
	}
	
	@Override
	public List<ClassVO> foroff(int classyear, int classmonth) {
		return mapper.foroff(classyear, classmonth);
	}
}