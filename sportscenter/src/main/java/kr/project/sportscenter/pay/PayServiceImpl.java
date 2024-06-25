package kr.project.sportscenter.pay;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;

import kr.project.sportscenter.class1.ClassMapper;
import kr.project.sportscenter.notice.NoticeVO;
import kr.project.sportscenter.user.UserVO;

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
	public PayVO list2(PayVO vo) {
		List<PayVO> list = mapper.list2(vo);
		PayVO pvo = new PayVO();
		for(PayVO item : list) {
			pvo = item;
		}
		return pvo;
	}
	
	@Override
	public boolean regist(PayVO vo) {
		return mapper.regist(vo) == 0 ? false : true;
	}

	@Override
	public boolean exists(PayVO vo) {
		return mapper.exists(vo) > 0 ? true : false;
	}

	@Override
	public boolean update(PayVO vo) {
		return mapper.update(vo) > 0 ? true : false;
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
        map.put("page", param.getPage());
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
	
	@Override
	public boolean courseModify(PayVO vo) {
		return mapper.courseModify(vo) > 0 ? true : false ;
	}

	@Override
	public PayVO clist(int payid) {
		return mapper.clist(payid);
	}

	@Override
	public boolean offregist(PayVO vo) {
		return mapper.offregist(vo) == 0 ? false : true;
	}

	@Override
	public Map<String, Object> selectThisMonth(PayVO vo) {
		Map<String, Object> map = new HashMap<>();
		List<PayVO> list = mapper.selectThisMonth(vo);
	    map.put("list", list);
	    return map;
	}

	@Override
	public String getToken(String apiKey, String secretKey) throws IOException {
		String urlString = "https://api.iamport.kr/users/getToken";
		URL url = new URL(urlString);
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		
		conn.setRequestMethod("POST"); // 요청 방식을 POST로 설정
		conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setDoOutput(true); // 연결을 출력 스트림으로 사용
		
        JsonObject json = new JsonObject();
		json.addProperty("imp_key", apiKey);
		json.addProperty("imp_secret", secretKey);
		
		// 출력 스트림으로 해당 conn에 요청
		BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		writer.write(json.toString());
		writer.flush();
		writer.close();
		
		// 입력 스트림으로 conn 요청에 대한 응답 반환
		BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		Gson gson = new Gson();
		String response = gson.fromJson(reader.readLine(), Map.class).get("response").toString();
		String accessToken = gson.fromJson(response, Map.class).get("access_token").toString();
		reader.close();
		
		conn.disconnect();
		
		System.out.println("Iamport access token 발급 성공 " + accessToken);
		return accessToken;
	}

}