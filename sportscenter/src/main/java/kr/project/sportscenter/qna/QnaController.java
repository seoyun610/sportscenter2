package kr.project.sportscenter.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.project.sportscenter.user.UserVO;


@Controller
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@GetMapping("/qna/index.do")
	public String index(Model model, QnaVO vo) {
		model.addAttribute("map", service.list(vo));
		return "qna/index";
	}
	
	@GetMapping("/qna/write.do")
	public String write() {
		return "qna/write";
	}
	
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
	
	@GetMapping("/qna/view.do")
	public String view(Model model, QnaVO vo) {
		model.addAttribute("vo", service.detail(vo, true));
		return "qna/view";
	}
	@GetMapping("/qna/edit.do")
	public String edit(Model model, QnaVO vo) {
		model.addAttribute("vo", service.detail(vo, false));
		return "qna/edit";
	}
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
	@GetMapping("/qna/reply.do")
	public String reply(Model model, QnaVO vo) {
		model.addAttribute("vo", service.detail(vo, false));
		return "qna/reply";
	}
	@PostMapping("/qna/reply.do")
	public String replyProcess(Model model, HttpServletRequest request, QnaVO vo, MultipartFile file) {
		HttpSession sess = request.getSession();
		UserVO login = (UserVO)sess.getAttribute("login");
		//관리자가 바꿔주는 것이기에 UserVO 나중에 수정해야 함! 
		vo.setUsernum(login.getUsernum());
		int r = service.reply(vo, file, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}
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
