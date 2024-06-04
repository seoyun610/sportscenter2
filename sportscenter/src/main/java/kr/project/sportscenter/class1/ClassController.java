package kr.project.sportscenter.class1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.project.sportscenter.level.LevelService;
import kr.project.sportscenter.level.LevelVO;
import kr.project.sportscenter.sport.SportService;
import kr.project.sportscenter.sport.SportVO;
import kr.project.sportscenter.time.TimeService;
import kr.project.sportscenter.time.TimeVO;


@Controller
public class ClassController {
	
	@Autowired
	private ClassService cservice;
	
	@Autowired
	private SportService sservice;
	
	@Autowired
	private LevelService lservice;
	
	@Autowired
	private TimeService tservice;
	
	@GetMapping("/class/list.do")
	public String regist(Model model, ClassVO cvo, SportVO svo, LevelVO lvo, TimeVO tvo) {
		model.addAttribute("map", cservice.list(cvo));
		model.addAttribute("smap", sservice.list(svo));
		model.addAttribute("lmap", lservice.list(lvo));
		model.addAttribute("tmap", tservice.list(tvo));
		return "class/list";
	}
	
}
