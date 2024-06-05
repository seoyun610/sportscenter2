package kr.project.sportscenter.class1;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.project.sportscenter.admin.AdminVO;
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
	public String list(Model model, ClassVO cvo, SportVO svo, LevelVO lvo, TimeVO tvo) {
		if(cvo.getClassmonth()<1) {
			LocalDate now = LocalDate.now();
			cvo.setClassyear(now.getYear());
			cvo.setClassmonth(now.getMonthValue()+1);
		}
		model.addAttribute("map", cservice.list(cvo));
		model.addAttribute("smap", sservice.list(svo));
		model.addAttribute("lmap", lservice.list(lvo));
		model.addAttribute("tmap", tservice.list(tvo));
		return "class/list";
	}
	
	@GetMapping("/admin/list.do")
	public String adminList(Model model, ClassVO cvo, SportVO svo, LevelVO lvo, TimeVO tvo) {
		
		model.addAttribute("map", cservice.list(cvo));
		model.addAttribute("smap", sservice.list(svo));
		model.addAttribute("lmap", lservice.list(lvo));
		model.addAttribute("tmap", tservice.list(tvo));
		return "admin/classList";
	}
	
	@GetMapping("/admin/regist.do")
	public String regist(Model model, ClassVO cvo, SportVO svo, LevelVO lvo, TimeVO tvo) {
		model.addAttribute("map", cservice.list(cvo));
		model.addAttribute("smap", sservice.list(svo));
		model.addAttribute("lmap", lservice.list(lvo));
		model.addAttribute("tmap", tservice.list(tvo));
		return "admin/classRegist";
	}
	
	@GetMapping("/admin/add.do")
	public String add(Model model, ClassVO cvo, SportVO svo, LevelVO lvo, TimeVO tvo) {
		boolean r = cservice.regist(cvo);
		if(r) {
			return "redirect:/class/list.do";
		} else {
			return "common/alert";
		}
	}
}
