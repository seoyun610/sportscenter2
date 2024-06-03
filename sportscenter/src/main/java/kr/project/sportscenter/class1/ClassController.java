package kr.project.sportscenter.class1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ClassController {
	
	@Autowired
	private ClassService service;
	
	@GetMapping("/class/list.do")
	public String regist(Model model, ClassVO vo) {
		model.addAttribute("map", service.list(vo));
		return "class/list";
	}
	
}
