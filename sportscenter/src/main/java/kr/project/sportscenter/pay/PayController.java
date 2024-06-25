package kr.project.sportscenter.pay;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;

import kr.project.sportscenter.class1.ClassService;
import kr.project.sportscenter.class1.ClassVO;
import kr.project.sportscenter.user.UserService;
import kr.project.sportscenter.user.UserVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PayController {
	
	@Autowired
	private PayService service;
	
	@Autowired
	private ClassService cservice;
	
	@Autowired
	private UserService uservice;
	
	
	private IamportClient api;
	
    @Autowired
    private JdbcTemplate jdbcTemplate;
	
	
	public PayController() {
		this.api= new IamportClient("0018758166838322", "hLG57eS6vRX4vUsy5rV6TZ98MVwgdyUj45z5hqrS7CdrS5MVPl22hST3dIdJQEnjuhvjf7Da0nzJd2Of");
		System.out.println(api);
	}
	
	String apiKey = "0018758166838322";
	String secretKey = "hLG57eS6vRX4vUsy5rV6TZ98MVwgdyUj45z5hqrS7CdrS5MVPl22hST3dIdJQEnjuhvjf7Da0nzJd2Of";
	
	/*
	 * @GetMapping("/pay/payCheck.do") 
	 * public String payCheck2
	 * (@RequestParam("classid") int classid, Model model, PayVO vo, HttpSession sess) { 
	 * UserVO login = (UserVO)sess.getAttribute("login");
	 * vo.setUsernum(login.getUsernum()); 
	 * vo.setClassid(classid);
	 * model.addAttribute("uvo",login); 
	 * model.addAttribute("vo",vo); 
	 * return "pay/payCheck"; 
	 * }
	 */
	
	@PostMapping("/pay/complete.do")
	public ResponseEntity payComplete(@RequestBody PayVO pvo, Model model, HttpSession sess) throws IamportResponseException {
	    try {
	    	System.out.println("원래 pvo: " + pvo);
	    	if(pvo.getRetake() == 1) { // 재수강 결제인 경우
	    		ClassVO cvo = new ClassVO();
		        cvo.setClassid(pvo.getClassid());
		        cvo = cservice.select(cvo);
		        if (cvo.getClasslimit() > cvo.getClasscnt()) { // 수강인원이 남았는지 확인
		    		cvo.setClasscnt(cvo.getClasscnt()+1);
		        	boolean updatecnt = cservice.updateCnt(cvo);

		        	if(updatecnt) {
		        		System.out.println("인원수 증가 성공");
			        	PayVO newPvo = new PayVO();
			        	newPvo = service.list2(pvo);
			        	System.out.println("list2 결과: " + newPvo);
			    		newPvo.setPaystate(1);
			    		newPvo.setImp_uid(pvo.getImp_uid());
			    		System.out.println("set 처리 후: " + newPvo);
			    		boolean updatepay = service.update(newPvo);
			    		if(updatepay) {
			    			System.out.println("결제정보 업데이트 성공");
			    			return new ResponseEntity("ok", HttpStatus.OK);
			    		}
			    		else {
			    			System.out.println("결제정보 업데이트 실패");
			    			return new ResponseEntity("bad_request", HttpStatus.BAD_REQUEST);
			    			// 롤백 코드
			    		}
		        	}
		        	else {
		        		System.out.println("인원수 증가 실패");
		        		return new ResponseEntity("bad_request", HttpStatus.BAD_REQUEST);
		        		// 롤백 코드
		        	}	
		        }
		        else {
		        	System.out.println("수강인원이 마감됐습니다.");
		        	return new ResponseEntity("bad_request", HttpStatus.BAD_REQUEST);
		        }
	    	}
	    	else { // 신규 수업 결제인 경우
	    		ClassVO cvo = new ClassVO();
		        cvo.setClassid(pvo.getClassid());
		        cvo = cservice.select(cvo);
		        if (cvo.getClasslimit() > cvo.getClasscnt()) {
		        	cvo.setClasscnt(cvo.getClasscnt()+1);
		        	boolean updatecnt = cservice.updateCnt(cvo);

		        	if(updatecnt) {
		        		System.out.println("인원수 증가 성공");
		        		UserVO user = (UserVO)sess.getAttribute("login");
			        	PayVO newPvo = new PayVO();
			        	newPvo.setClassid(pvo.getClassid());
			        	newPvo.setUsernum(user.getUsernum());
			    		newPvo.setPaystate(1);
			    		newPvo.setPrice(pvo.getPrice());
			    		newPvo.setImp_uid(pvo.getImp_uid());
			    		boolean insertpay = service.regist(newPvo);
			    		
			    		if(insertpay) {
			    			System.out.println("결제정보 생성 성공");
			    			return new ResponseEntity("ok", HttpStatus.OK);
			    		}
			    		else {
			    			System.out.println("결제정보 생성 실패");
			    			return new ResponseEntity("bad_request", HttpStatus.BAD_REQUEST);
			    			// 롤백 코드
			    		}
		        	}
		        	else {
		        		System.out.println("인원수 증가 실패");
		        		return new ResponseEntity("bad_request", HttpStatus.BAD_REQUEST);
		        		// 롤백 코드
		        	}
		        }
		        else {
		        	System.out.println("수강인원이 마감됐습니다.");
		        	return new ResponseEntity("bad_request", HttpStatus.BAD_REQUEST);
		        }
	    	}
	    } catch (Exception e) {
	    	e.printStackTrace();
	        return new ResponseEntity("error",HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	    
	}
	
	/*
	 * @PostMapping("/pay/payCheck.do") public String
	 * payCheck(@RequestParam("classid") int classid, Model model, PayVO vo,
	 * HttpSession sess) { UserVO login = (UserVO)sess.getAttribute("login");
	 * vo.setUsernum(login.getUsernum()); vo.setClassid(classid);
	 * model.addAttribute("uvo",login); model.addAttribute("vo",vo);
	 * System.out.println(vo);
	 * 
	 * 
	 * boolean exists = service.exists(vo);
	 * 
	 * if (exists) { boolean r = service.update(vo);
	 * model.addAttribute("login",login); if (r) { model.addAttribute("msg",
	 * "결제가 완료되었습니다."); } else { model.addAttribute("msg", "결제에 실패했습니다."); } } else
	 * { boolean r = service.regist(vo); if (r) { model.addAttribute("msg",
	 * "결제가 완료되었습니다."); } else { model.addAttribute("msg", "결제에 실패했습니다."); } }
	 * model.addAttribute("url", "/mypage/classView.do"); return "common/alert"; }
	 */
	
	@GetMapping("/pay/cancel/{payid}/{classid}")
	public String cancelPayment(@PathVariable int payid, @PathVariable int classid, Model model, HttpSession sess) {
		System.out.println("===============cancel===============");
		System.out.println("=== payid: " + payid + "classid: " + classid);
		LocalDate today = LocalDate.now();
		int month = today.getMonthValue();
		int day = today.getDayOfMonth();
		
		UserVO uvo = (UserVO)sess.getAttribute("login");
		ClassVO cvo = new ClassVO();
		cvo.setClassid(classid);
		cvo = cservice.select(cvo);
		
		PayVO pvo = new PayVO();
		pvo.setPayid(payid); 
		pvo.setUsernum(uvo.getUsernum());
		pvo = service.list2(pvo);
		int pre_price = pvo.getPrice();
		int cancel_price;
		
		// if(cvo.getClassmonth() == month && day >= 1 && day <= 10) {
		if(cvo.getClassmonth() == month) {
			cancel_price = (int) (pre_price * 0.5);
			cvo.setClassprice(cancel_price);
			pvo.setPrice(cancel_price);
			model.addAttribute("cvo", cvo);
			model.addAttribute("pvo", pvo);
			return "pay/cancel";
		} else {
			model.addAttribute("msg", "환불 오류");
			model.addAttribute("url", "/mypage/classView.do");
			return "common/alert";
		}
	}
	
	public static class CancelRequest {
	    private String imp_uid;
	    private int amount;

	    // Getters and Setters
	    public String getImp_uid() {
	        return imp_uid;
	    }

	    public void setImp_uid(String imp_uid) {
	        this.imp_uid = imp_uid;
	    }

	    public int getAmount() {
	        return amount;
	    }

	    public void setAmount(int amount) {
	        this.amount = amount;
	    }
	}
	
	@PostMapping("/pay/cancel/complete")
	@ResponseBody
	public ResponseEntity<Map<String,String>> completeCancel(@RequestBody CancelRequest cancelRequest, Model model) throws IOException {
		//ObjectMapper objmapper = new ObjectMapper();
		//PayVO pvo = (PayVO)objmapper.readValue(canceldata, new TypeReference<PayVO>() {});
		System.out.println("===============cancel complete===============");
		String imp_uid = cancelRequest.getImp_uid();
	    int amount = cancelRequest.getAmount();
		
	    String accessToken = service.getToken(apiKey, secretKey);
		URL url = new URL("https://api.iamport.kr/payments/cancel");
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		
		conn.setRequestMethod("POST");
		
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
        conn.setRequestProperty("Authorization", accessToken);
        
        conn.setDoOutput(true);
        
        JsonObject json = new JsonObject();
        json.addProperty("imp_uid", imp_uid);
        json.addProperty("amount", amount);
        
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        writer.write(json.toString());
        writer.flush();
        writer.close();
        
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        Gson gson = new Gson();
        double doublecode = (double) gson.fromJson(reader.readLine(), Map.class).get("code");
        int responsecode = (int)Math.round(doublecode);
        
        Map<String, String> map = new HashMap<>();
        
        if(responsecode == 0) {
        	reader.close();
            conn.disconnect();
            
            PayVO pvo = new PayVO();
            pvo.setImp_uid(imp_uid);
            pvo = service.list2(pvo);
            int classid = pvo.getClassid();
            pvo.setCancelstate(1);
            pvo.setRefundstate(1);
            boolean payresult = service.update(pvo);
            
            ClassVO cvo = new ClassVO();
            cvo.setClassid(classid);
            cvo = cservice.select(cvo);
            int newcnt = cvo.getClasscnt() - 1;
            cvo.setClasscnt(newcnt);
            boolean classresult = cservice.updateCnt(cvo);

            if(payresult && classresult) {
            	System.out.println("db 업데이트 성공");
            	map.put("result", "ok");
            	return new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
            } else {
            	System.out.println("db 업데이트 실패");
            	map.put("result", "bad_request");
            	return new ResponseEntity<Map<String,String>>(map, HttpStatus.BAD_REQUEST);
            }
        } else {
        	reader.close();
            conn.disconnect();
            //return new ResponseEntity("bad_request", HttpStatus.BAD_REQUEST);
        }
        map.put("result", "not_found");
        return new ResponseEntity<Map<String,String>>(map, HttpStatus.NOT_FOUND);
//        String response = gson.fromJson(reader.readLine(), Map.class).get("response").toString();
//        System.out.println("=========응답========= " + response);
	}

	
	@PostMapping("/pay/payment.do")
	public String payment(Model model,PayVO vo, HttpSession sess) {
		return "pay/payment";
	}
	
	@GetMapping("/admin/courseList.do")
	public String courseList(Model model,PayVO vo) {
		model.addAttribute("map", service.courseList(vo));
		return "admin/courseList";
	}
	


    // 매달 24일 자정에 실행 (cron 표현식: "0 0 0 24 * ?")
    @Scheduled(cron = "0 0 0 24  * ?")
    public void cleanupOldPayEntries() {
        String sql = "DELETE FROM pay WHERE paystate = 0 AND refundstate = 0 AND cancelstate = 0";
        jdbcTemplate.update(sql);
    }
	
    // 다음달 재수강 결제 내역 등록
    // @Scheduled(cron="0 19 9 15 * ?") // 매달 20일 오전 9시 15분에 실행
	@Scheduled(cron="0 59 15 * * ?") // 테스트용
    public void addAll() {
    	LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		int nextMonth = now.getMonthValue() + 1;
		
		PayVO vo = new PayVO();
		vo.setPaystate(1);
		vo.setCancelstate(0);
		vo.setRefundstate(0);
		vo.setClassmonth(month);
		Map<String, Object> map = service.selectThisMonth(vo);
		List<PayVO> list = (List<PayVO>)map.get("list");
		System.out.println("======");
		System.out.println(list);
		for(PayVO item : list) {
			int pre_classid = item.getClassid();
			int pre_usernum = item.getUsernum();
			
			ClassVO pre_cvo = new ClassVO();
			pre_cvo.setClassid(pre_classid);
			pre_cvo = cservice.select(pre_cvo);
			
			int pre_subtype = pre_cvo.getSubtype();
			int pre_classlevel = pre_cvo.getClasslevel();
			int pre_classtime = pre_cvo.getClasstime();
			String pre_classday = pre_cvo.getClassday();
			
			ClassVO new_cvo = new ClassVO();
			new_cvo.setSubtype(pre_subtype);
			new_cvo.setClasslevel(pre_classlevel);
			new_cvo.setClasstime(pre_classtime);
			new_cvo.setClassday(pre_classday);
			new_cvo.setClassyear(year);
			new_cvo.setClassmonth(nextMonth);
			
			new_cvo = cservice.select(new_cvo);

			item.setClassid(new_cvo.getClassid());
			item.setUsernum(pre_usernum);
			item.setPaystate(0);
			item.setCancelstate(0);
			item.setRefundstate(0);
			item.setPrice(new_cvo.getClassprice());
		}
		
		boolean r = service.addAll(list);
		if(r) {
			System.out.println("재수강 내역 삽입 완료");
		} else {
			System.out.println("재수강 내역 삽입 실패");
		}
	}
    
    @GetMapping("/admin/courseModify.do")
    public String cModify(@RequestParam int payid, Model model, PayVO vo) {
    	PayVO cvo = service.clist(payid);
    	System.out.println(vo);
    	System.out.println(cvo);
    	int classid = cvo.getClassid();
    	int classyear = vo.getClassyear();
    	int classmonth = vo.getClassmonth();
    	System.out.println(classid);
    	model.addAttribute("payid", payid);
        model.addAttribute("cmap", cservice.cmodify(classid, classyear, classmonth));
        System.out.println(cservice.cmodify(classid, classyear, classmonth));
        return "admin/courseModify";
    }
    
	@PostMapping("/admin/courseModify.do")
	public String cModify(Model model,PayVO vo, @RequestParam int classid, @RequestParam int payid) {
		vo.setClassid(classid);
		vo.setPayid(payid);
		boolean r = service.courseModify(vo);
		if(r) {
			model.addAttribute("msg", "변경이 완료되었습니다.");
			model.addAttribute("url", "/admin/courseList.do");
			return "common/alert";
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "변경 오류");
			return "common/alert";
		}
	}
	
	@GetMapping("/admin/offRegist.do")
    public String cModify(Model model, PayVO vo) {
        return "admin/offRegist";
    }
	
	@PostMapping("/admin/offRegist.do")
	public String offregist(Model model, PayVO vo, ClassVO cvo, @RequestParam int classid, @RequestParam int usernum, @RequestParam int price) {
		vo.setClassid(classid);
		vo.setUsernum(usernum);
		vo.setPrice(price);
		boolean r = service.offregist(vo);
		cvo.setClassid(classid);
		cvo.setClasscnt(cvo.getClasscnt() + 1);
	    boolean updatecnt = cservice.updateCnt(cvo);
		if(r && updatecnt) {
			model.addAttribute("msg", "현장 등록이 완료되었습니다.");
			model.addAttribute("url", "/admin/offRegist.do");
			return "common/alert";
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
			return "common/alert";
		}
	}
    
}
	
