package kr.project.sportscenter.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.project.sportscenter.qna.QnaVO;

@Controller
public class ReplyController {
		
	    @Autowired
		ReplyService service;
		
		@GetMapping("/reply/view.do")
		public String list(ReplyVO vo, QnaVO qvo,Model model) {
			model.addAttribute("vo", service.vindex(vo));
			model.addAttribute("qvo", service.qindex(qvo));
			return "reply/view";
		}
		
		@GetMapping("/reply/insert.do")
		public String insert(ReplyVO vo, Model model) {
			model.addAttribute("result", service.insert(vo));
			return "reply/result";
		}
		
		@GetMapping("/reply/delete.do")
		public String delete(ReplyVO vo, Model model) {
			model.addAttribute("result", service.delete(vo));
			return "reply/result";
		}
}
