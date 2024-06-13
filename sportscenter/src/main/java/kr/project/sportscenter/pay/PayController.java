package kr.project.sportscenter.pay;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import kr.project.sportscenter.class1.ClassService;
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
	
	public PayController() {
		this.api= new IamportClient("0018758166838322", "hLG57eS6vRX4vUsy5rV6TZ98MVwgdyUj45z5hqrS7CdrS5MVPl22hST3dIdJQEnjuhvjf7Da0nzJd2Of");
		System.out.println(api);
	}
	
	@ResponseBody
    @RequestMapping("/verify/{imp_uid}")
    public ResponseEntity<?> paymentByImpUid(@PathVariable("imp_uid") String imp_uid) {
        try {
            IamportResponse<Payment> paymentResponse = api.paymentByImpUid(imp_uid);
            return ResponseEntity.ok(paymentResponse);
        } catch (IamportResponseException e) {
            if (e.getHttpStatusCode() == 404) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("결제 정보를 찾을 수 없습니다: " + imp_uid);
            }
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("결제 조회 중 오류가 발생했습니다.");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 오류가 발생했습니다.");
        }
    }
	
	
	/*
	 * @GetMapping("/pay/payCheck.do") public String
	 * payCheck2(@RequestParam("classid") int classid, Model model, PayVO vo,
	 * HttpSession sess) { UserVO login = (UserVO)sess.getAttribute("login");
	 * vo.setUsernum(login.getUsernum()); vo.setClassid(classid);
	 * model.addAttribute("uvo",login); model.addAttribute("vo",vo); return
	 * "pay/payCheck"; }
	 */
	
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
	
	
}
	
