package kr.project.sportscenter.pay;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.project.sportscenter.class1.ClassService;
import kr.project.sportscenter.class1.ClassVO;
import kr.project.sportscenter.sport.SportService;
import kr.project.sportscenter.user.UserVO;

@Controller
public class PayController {
	
	@Autowired
	private PayService service;
	
	@Autowired
	private ClassService cservice;
	
	@PostMapping("/pay/payCheck2.do")
	public String payCheck(@RequestParam("classid") int classid, Model model, PayVO vo, HttpSession sess) {
		UserVO login = (UserVO)sess.getAttribute("login");
	    vo.setUsernum(login.getUsernum());
	    vo.setClassid(classid);
		System.out.println(vo);
		
		boolean exists = service.exists(vo);
		
	    if (exists) {
	        boolean r = service.update(vo);
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
}
	
