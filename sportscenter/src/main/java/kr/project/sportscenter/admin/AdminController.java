package kr.project.sportscenter.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.project.sportscenter.notice.NoticeService;
import kr.project.sportscenter.notice.NoticeVO;
import kr.project.sportscenter.qna.QnaService;
import kr.project.sportscenter.qna.QnaVO;
import kr.project.sportscenter.reply.ReplyService;
import kr.project.sportscenter.reply.ReplyVO;
import kr.project.sportscenter.subject.SubjectService;
import kr.project.sportscenter.subject.SubjectVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@Autowired
	QnaService service2;
	
	@Autowired
	ReplyService rservice;
	
	@Autowired
	NoticeService nservice;
	
	@Autowired
	SubjectService sservice;
	
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
	
	//qna
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
	
	//notice
	@GetMapping("/admin/adminNotice.do")
	public String adminNotice(Model model, NoticeVO vo) {
		model.addAttribute("map",nservice.list(vo));
		return "admin/adminNotice";
	} 
	
	@GetMapping("/admin/adminNoticeView.do")
	public String adminNoticeView(Model model, NoticeVO vo, HttpSession sess) {
		AdminVO login = (AdminVO)sess.getAttribute("adminLogin");
		vo.setAdminnum(login.getAdminnum());
		model.addAttribute("vo",nservice.detail(vo, true));
		return "admin/adminNoticeView";
	}
	
	//subject
	@GetMapping("/admin/adminSubject.do")
	public String listsubject(Model model, SubjectVO vo) {
        model.addAttribute("map", sservice.list(vo));
        return "admin/adminSubject"; 
    }
	
	@GetMapping("/admin/adminSubjectView.do")
	public String adminSubjectView(Model model, SubjectVO vo, HttpSession sess) {
		AdminVO login = (AdminVO)sess.getAttribute("adminLogin");
		vo.setAdminnum(login.getAdminnum());
		model.addAttribute("vo",sservice.detail(vo, true));
		return "admin/adminSubjectView";
	}

}
