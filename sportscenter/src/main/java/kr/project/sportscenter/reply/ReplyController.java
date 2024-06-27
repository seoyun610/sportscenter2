package kr.project.sportscenter.reply;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
			model.addAttribute("list",list);
			return "reply/view";
		}
		
		@PostMapping("/reply/insert.do")
		public String insert(@RequestParam("qnaid") int qnaid, ReplyVO vo, Model model, HttpSession session) {
			AdminVO login = (AdminVO)session.getAttribute("adminLogin");
			vo.setAdminnum(login.getAdminnum());
			vo.setQnaid(qnaid);
			System.out.println(qnaid);
			int r = service.insert(vo);
			if (r > 0) {
				model.addAttribute("cmd", "move");
				model.addAttribute("msg", "정상적으로 저장되었습니다.");
				model.addAttribute("url", "/admin/adminQnaView.do");
			} else {
				model.addAttribute("cmd", "back");
				model.addAttribute("msg", "등록 오류");
			}
			return "common/alert";
			
		}
		
		@PostMapping("/reply/update.do")
		public String update(@RequestParam("qnaid") int qnaid, ReplyVO vo, Model model) {
			vo.setQnaid(qnaid);
			int r = service.update(vo);
			
			if (r > 0) {
				model.addAttribute("cmd", "move");
				model.addAttribute("msg", "정상적으로 저장되었습니다.");
			} else {
				model.addAttribute("cmd", "back");
				model.addAttribute("msg", "등록 오류");
			}
			return "common/alert";
		
		}
		
		@GetMapping("/reply/delete.do")
		public String delete(@RequestParam("replyid") int replyid, ReplyVO vo, Model model) {
			System.out.println("=== " + replyid);
			vo.setReplyid(replyid);
			int r = service.delete(vo);
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
