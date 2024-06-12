package kr.project.sportscenter.reply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.project.sportscenter.admin.AdminVO;

@Controller
public class ReplyController {
		
	    @Autowired
		ReplyService service;
		
		@GetMapping("/reply/view.do")
		public String list(@RequestParam("qnaid") int qnaid, ReplyVO vo, Model model) {
			vo.setQnaid(qnaid);
			List<ReplyVO> list = service.list(vo);
			model.addAttribute("vo",list);
			return "reply/view";
		}
		
		@PostMapping("/reply/insert.do")
		public String insert(@RequestParam("qnaid") int qnaid, ReplyVO vo, Model model, HttpSession session) {
			AdminVO login = (AdminVO)session.getAttribute("adminLogin");
			vo.setAdminnum(login.getAdminnum());
			vo.setQnaid(qnaid);
			System.out.println(qnaid);
			model.addAttribute("result", service.insert(vo));
			System.out.println(model);
			return "reply/result";
		}
		
		@PostMapping("/reply/update.do")
		public String update(@RequestParam("qnaid") int qnaid, ReplyVO vo, Model model) {
			vo.setQnaid(qnaid);
			int r = service.update(vo);
			
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
		
		@GetMapping("/reply/delete.do")
		public String delete(ReplyVO vo, Model model) {
			model.addAttribute("result", service.delete(vo));
			return "reply/result";
		}
}
