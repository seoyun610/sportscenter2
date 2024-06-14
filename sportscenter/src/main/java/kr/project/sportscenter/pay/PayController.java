package kr.project.sportscenter.pay;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

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
	
	@PostMapping("/payments/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(@PathVariable String imp_uid) throws IamportResponseException, IOException{
		log.info("paymentByImpUid 진입");
		return api.paymentByImpUid(imp_uid);
	}
	
	@PostMapping("/pay/payCheck.do")
	public String payCheck(@RequestParam("classid") int classid, Model model, PayVO vo, HttpSession sess) {
		UserVO login = (UserVO)sess.getAttribute("login");
	    vo.setUsernum(login.getUsernum());
	    vo.setClassid(classid);
	    model.addAttribute("uvo",login);
		model.addAttribute("vo",vo);
		System.out.println(vo);
		
		
		boolean exists = service.exists(vo);
		
	    if (exists) {
	        boolean r = service.update(vo);
	        model.addAttribute("login",login);
	        if (r) {
	            model.addAttribute("msg", "결제가 완료되었습니다.");
	        } else { 
	            model.addAttribute("msg", "결제에 실패했습니다.");
	        }
	    } else {
	        boolean r = service.regist(vo);
	        if (r) {
	            model.addAttribute("msg", "결제가 완료되었습니다.");
	        } else {
	            model.addAttribute("msg", "결제에 실패했습니다.");
	        }
	    }
	    model.addAttribute("url", "/mypage/classView.do");
	    return "common/alert";
	}
	
//		boolean r = service.regist(vo); 
//			if (r) {
//				model.addAttribute("msg", "결제가 완료되었습니다."); 
//				model.addAttribute("url", "/mypage/classView.do");
//			} 
//        return "common/alert";
	
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
	
	
}
	
