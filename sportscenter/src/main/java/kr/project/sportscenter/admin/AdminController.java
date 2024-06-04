package kr.project.sportscenter.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@GetMapping("/admin/adlogin.do")
	public void login() {
		
	}
	
	@PostMapping("/admin/adlogin.do")
	public String login(Model model, AdminVO vo, HttpSession sess) { 
		AdminVO login = service.adminlogin(vo);
		if(login == null) {
			model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요.");
			model.addAttribute("url", "/user/login.do");
			return "common/alert";
		}else {
			sess.setAttribute("login", login);
			return "redirect:home.do";
		}
	}

}
