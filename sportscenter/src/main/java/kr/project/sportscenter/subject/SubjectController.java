package kr.project.sportscenter.subject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.project.sportscenter.admin.AdminVO;


@Controller
public class SubjectController {
	@Autowired
    private SubjectService service;

	// 목록 조회
    @GetMapping("/subject/index.do")
    public String listsubject(Model model, SubjectVO vo) {
        model.addAttribute("map", service.list(vo));
        return "subject/index"; 
    }
    // 상세 조회 
    @GetMapping("/subject/view.do")
	public String view(Model model, SubjectVO vo) {
		model.addAttribute("vo", service.detail(vo, true));
		return "subject/view";
	}
    
    // 작성 
    @GetMapping("/subject/write.do")
	public String write() {
		return "subject/write";
	}
	@PostMapping("/subject/insert.do")
	public String insert(Model model, HttpSession sess, HttpServletRequest request, SubjectVO vo, MultipartFile file) {
		AdminVO login = (AdminVO)sess.getAttribute("adminLogin"); 
		vo.setAdminnum(login.getAdminnum());
		int r = service.insert(vo, sess, file, request);
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
	
	// 수정 
	@GetMapping("/subject/edit.do")
	public String edit(Model model, SubjectVO vo) {
		model.addAttribute("vo", service.detail(vo, false));
		return "notice/edit";
	}
	@PostMapping("/subject/update.do")
	public String update(Model model, HttpServletRequest request, SubjectVO vo, MultipartFile file) {
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
	
	// 삭제
	@GetMapping("/subject/delete.do")
	public String delete(Model model, HttpServletRequest request, SubjectVO vo, MultipartFile file) {
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
