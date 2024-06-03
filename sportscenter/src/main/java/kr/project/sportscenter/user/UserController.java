package kr.project.sportscenter.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class UserController {
	
	@Autowired 
	private UserService service;
	
	@GetMapping("/user/login.do")
	public void login() {
		
	}
	
	@PostMapping("/user/login.do")
	public String login(Model model, UserVO vo, HttpSession sess) {
		UserVO login = service.login(vo);
		if(login == null) {
			model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요.");
			model.addAttribute("url", "/user/login.do");
			return "common/alert";
		}else {
			sess.setAttribute("login", login);
			return "redirect:/main.do";
		}
	}
	
	@ResponseBody
	@GetMapping("/user/useridCheck.do")
	public int useridCheck(String userid) {
		return service.useridCheck(userid);
	}
	
	@ResponseBody
	@GetMapping("/user/emailCheck.do")
	public int emailCheck(String email) {
		return service.emailCheck(email);
	}
	
	@PostMapping("/user/insert.do")
	public String insert(UserVO vo, Model model) {
		if (service.join(vo)) {
			model.addAttribute("msg", "정상적으로 가입되었습니다.");
			model.addAttribute("url", "/main.do");
		} else {
			model.addAttribute("msg", "가입 오류"); 
			model.addAttribute("url", "/join.do");
		}
		return "common/alert";
	}
	
	
	
	
	
	

}
