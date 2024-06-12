package kr.project.sportscenter.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.project.sportscenter.qna.QnaService;
import kr.project.sportscenter.qna.QnaVO;
import kr.project.sportscenter.reply.ReplyService;
import kr.project.sportscenter.reply.ReplyVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@Autowired
	QnaService service2;
	
	@Autowired
	ReplyService rservice;
	
	@GetMapping("/admin/adminLogin.do")
	public void adminLogin() {
		
	}
	
	@PostMapping("/admin/adminLogin.do")
	public String adminLogin(Model model, AdminVO vo, HttpSession sess) { 
		AdminVO login = (AdminVO)service.adminLogin(vo);
		if(login == null) {
			model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요.");
			model.addAttribute("url", "/admin/adminLogin.do");
			return "common/alert";
		}else {
			sess.setAttribute("adminLogin", login);
			return "redirect:userList.do";
		}
	}
	
	@GetMapping("/admin/userList.do")
		public void userList() {
			
		}
	
	@GetMapping("/admin/adminQna.do")
	public String adminQna(Model model, QnaVO vo) {
		model.addAttribute("map",service2.list(vo));
		return "admin/adminQna";
	} 
	
	@GetMapping("/admin/adminQnaView.do")
	public String adminQnaView(Model model, QnaVO vo, ReplyVO rvo, HttpSession sess) {
		AdminVO login = (AdminVO)sess.getAttribute("adminLogin");
		rvo.setAdminnum(login.getAdminnum());
		System.out.println(login.getAdminnum());
		model.addAttribute("rmap", rservice.list(rvo));
		model.addAttribute("map", service2.detail(vo, true));
		return "admin/adminQnaView";
	}
	
	
	

}
