package kr.project.sportscenter.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.project.sportscenter.admin.AdminVO;
import kr.project.sportscenter.reply.ReplyService;
import kr.project.sportscenter.reply.ReplyVO;
import kr.project.sportscenter.user.UserVO;


@Controller
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@Autowired
	ReplyService rservice;
	
	@GetMapping("/qna/index.do")
	public String index(Model model, QnaVO vo) {
		model.addAttribute("map", service.list(vo));
		return "qna/index";
	}
	//신규 Qna 작성 화면 요청 
	@GetMapping("/qna/write.do")
	public String write() {
		return "qna/write";
	}
	
	//신규 Qna 저장 처리 요청 
	@PostMapping("/qna/insert.do")
	public String insert(Model model, HttpServletRequest request, QnaVO vo, MultipartFile file) {
		HttpSession sess = request.getSession();
		UserVO login = (UserVO)sess.getAttribute("login");
		vo.setUsernum(login.getUsernum());
		int r = service.insert(vo, file, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}
	
	
	//Qna 글 상세 화면 요청 
	@GetMapping("/qna/view.do")
	public String view(Model model, QnaVO vo, ReplyVO rvo, HttpSession sess) {
		model.addAttribute("rmap", rservice.list(rvo));
		model.addAttribute("map", service.detail(vo, true));
		return "qna/view";
	}
	
	//Qna 글 수정 
	@GetMapping("/qna/edit.do")
	public String edit(Model model, QnaVO vo) {
		model.addAttribute("vo", service.detail(vo, false));
		return "qna/edit";
	}
	
	//Qna 글 수정 처리 요청 
	@PostMapping("/qna/update.do")
	public String update(Model model, HttpServletRequest request, QnaVO vo, MultipartFile file) {
		int r = service.update(vo, file, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}

	// Qna 삭제
	@GetMapping("/qna/delete.do")
	public String delete(Model model, HttpServletRequest request, QnaVO vo, MultipartFile file) {
		int r = service.delete(vo, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}

}