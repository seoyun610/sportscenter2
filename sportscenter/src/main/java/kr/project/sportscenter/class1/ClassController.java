package kr.project.sportscenter.class1;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.project.sportscenter.level.LevelService;
import kr.project.sportscenter.level.LevelVO;
import kr.project.sportscenter.pay.PayService;
import kr.project.sportscenter.pay.PayVO;
import kr.project.sportscenter.sport.SportService;
import kr.project.sportscenter.sport.SportVO;
import kr.project.sportscenter.time.TimeService;
import kr.project.sportscenter.time.TimeVO;
import kr.project.sportscenter.user.UserVO;


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
	
	@Autowired
	private PayService pservice;
	
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
			return "redirect:/admin/list.do";
		} else {
			return "common/alert";
		}
	}
	
	// 다음달 신규 수업 등록
    @Scheduled(cron = "0 18 9 15 * ?") // 매달 18일 오전 9시 15분에 실행
    public void insertData() {
        ClassVO cvo = new ClassVO();
        cvo.setClassmonth(LocalDate.now().getMonthValue()); // 현재 월 설정
        Map<String, Object> map = cservice.list(cvo);
        List<ClassVO> list = (List<ClassVO>) map.get("list");
        
        int insertMonth = (cvo.getClassmonth() % 12) + 1; // 시스템 월 +1 계산

        for (ClassVO item : list) {
            item.setClassmonth(insertMonth);
            item.setClasscnt(0);
        }

        boolean result = cservice.registAll(list);
        if (result) {
            System.out.println("데이터 삽입 성공");
        } else {
            System.out.println("데이터 삽입 실패");
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
		ClassVO cvo = new ClassVO();
		cvo.setClassid(classid);
		System.out.println(cservice.select(cvo));
		model.addAttribute("obj", cservice.select(cvo));
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
	
	@GetMapping("/admin/delete/{classid}")
	public String deleteClass(@PathVariable int classid, Model model) {
		boolean r = cservice.delete(classid);
		if(r) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "/admin/list.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "삭제 오류");
		}
		return "common/alert";
	}
	
	@GetMapping("/class/payCheck.do")
	public String payCheck(@RequestParam int retake, @RequestParam(name = "classid") int classid, Model model, HttpSession sess) {
		System.out.println("==============retake================"+ retake);
		System.out.println("==============classid================" + classid);
		ClassVO cvo = new ClassVO();
		UserVO login = (UserVO)sess.getAttribute("login");
	    cvo.setClassid(classid);
		/*
		 * if(retake == 1) { System.out.println("==============접근 확인================");
		 * PayVO pvo = new PayVO(); pvo.setClassid(classid); pvo.setPaystate(0);
		 * pvo.setUsernum(login.getUsernum()); model.addAttribute("pvo",
		 * pservice.select(pvo)); }
		 */
	    model.addAttribute("uvo",login);
		model.addAttribute("cvo",cservice.select(cvo));
		return "pay/payCheck";
	}
	
	@GetMapping("/class/foroff.do")
	public ResponseEntity<List<ClassVO>> getClassList(@RequestParam("classyear") int classyear, @RequestParam("classmonth") int classmonth) {
	    List<ClassVO> classList = cservice.foroff(classyear, classmonth);
	    if (classList != null && !classList.isEmpty()) {
	        return new ResponseEntity<>(classList, HttpStatus.OK);
	    } else {
	        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	    }
	}

}
