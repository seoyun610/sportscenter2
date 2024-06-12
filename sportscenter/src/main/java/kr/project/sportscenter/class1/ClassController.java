package kr.project.sportscenter.class1;

import java.io.Console;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@PostMapping("/admin/add.do")
	public String add(Model model, ClassVO cvo, SportVO svo, LevelVO lvo, TimeVO tvo) {
		boolean r = cservice.regist(cvo);
		if(r) {
			return "redirect:/class/list.do";
		} else {
			return "common/alert";
		}
	}
	
	/*
	 * @GetMapping("/admin/modify.do") public String modify(Model
	 * model, @RequestParam Integer classchk, LevelVO lvo, TimeVO tvo) { //
	 * System.out.println("넘겨받은 값: "+ classchk);
	 * System.out.println(cservice.select(classchk)); model.addAttribute("obj",
	 * cservice.select(classchk)); model.addAttribute("lmap", lservice.list(lvo));
	 * model.addAttribute("tmap", tservice.list(tvo)); //
	 * System.out.println(model.getAttribute("obj")); return "admin/classModify"; }
	 */
	
	
//	  @PostMapping("/admin/modify.do") 
//	  public String modify(Model model, ClassVO cvo) { 
//		  System.out.println(cvo);
//		  boolean r = cservice.modify(cvo); 
//		  if(r) { return "admin/classList"; }
//		  else { return "common/alert"; } 
//	  }
	 
	
	@RequestMapping(value = "/admin/modify.do", method=RequestMethod.GET)
	public String modify(@RequestParam int classid, Model model, LevelVO lvo, TimeVO tvo) {
		System.out.println(cservice.select(classid));
		model.addAttribute("obj", cservice.select(classid));
		model.addAttribute("lmap", lservice.list(lvo));
		model.addAttribute("tmap", tservice.list(tvo));
		return "admin/classModify";
	}
	
	@RequestMapping(value = "/admin/modify.do", method=RequestMethod.POST)
	public String modify(Model model, ClassVO cvo, SportVO svo, LevelVO lvo, TimeVO tvo) {
		boolean r = cservice.modify(cvo);
		// model.addAttribute("map", cservice.list(cvo));
		model.addAttribute("smap", sservice.list(svo));
		model.addAttribute("lmap", lservice.list(lvo));
		model.addAttribute("tmap", tservice.list(tvo));
		if(r) {
			return "redirect:/admin/list.do";
		} else {
			return "common/alert";
		}
	}
	
	@GetMapping("/class/payCheck.do")
	public String payCheck(Model model, ClassVO cvo) {
	    model.addAttribute("map", cservice.list(cvo));
	    System.out.println(model);
	    return "pay/payCheck";
	}
}
