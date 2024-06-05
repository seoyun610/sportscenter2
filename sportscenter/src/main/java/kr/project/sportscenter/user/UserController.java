package kr.project.sportscenter.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.security.crypto.password.PasswordEncoder;


@Controller
public class UserController {
	
	@Autowired 
	private UserService service;
	
	@GetMapping("/user/login.do")
	public void login() {
		
	}
	
	@PostMapping("/user/login.do")
	public String login(Model model, UserVO vo, HttpSession sess) {
		UserVO login = service.login(vo);
		if(login == null) {
			model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요.");
			model.addAttribute("url", "/user/login.do");
			return "common/alert";
		}else {
			sess.setAttribute("login", login);
			return "redirect:/home.do";
		}
	}
	
	// 로그아웃 처리
	@RequestMapping("/user/logout.do")
	public String logout(HttpServletRequest request) {
	    // 세션에서 사용자 정보 제거
	    request.getSession().invalidate();
	    return "redirect:/home.do";
	}
	
	@ResponseBody
	@GetMapping("/user/useridCheck.do")
	public int useridCheck(String userid) {
		return service.useridCheck(userid);
	}
	
	@ResponseBody
	@GetMapping("/user/emailCheck.do")
	public int emailCheck(String email) {
		return service.emailCheck(email);
	}
	
	@PostMapping("/user/insert.do")
	public String insert(UserVO vo, Model model) {
		if (service.join(vo)) {
			model.addAttribute("msg", "정상적으로 가입되었습니다.");
			model.addAttribute("url", "/main.do");
		} else {
			model.addAttribute("msg", "가입 오류"); 
			model.addAttribute("url", "/join.do");
		}
		return "common/alert";
	}
	

	
	// 아이디 찾기 
	@PostMapping("/user/findId.do")
	@ResponseBody
	public String findId(@RequestParam("username") String username,
	                         @RequestParam("birth") String birth,
	                         @RequestParam("hp") String hp) {
	        UserVO result = service.findId(username, birth, hp);
	        if (result != null) {
	            // 아이디가 존재할 경우 아이디 반환
	            return result.getUserid();
	        	} else {
	            // 아이디가 존재하지 않을 경우 메시지 반환
	            return "fail";
	        	}
	  		} 
	  
  		//비밀번호 찾기 
  		@PostMapping("/user/findPassword.do")
  		@ResponseBody
  		public String findPassword(@RequestParam("userid")String userid,
  								   @RequestParam("birth")String birth, 
  								   @RequestParam("hp")String hp) {
  			UserVO result = service.findPassword(userid, birth, hp); 
  			if (result != null) {
  				return result.getPwd();
  			} else {
  				// 아이디와 회원정보가 일치하지 않을 경우 
  				return "fail";	
  			}
  		}
	  		
	  	
	  		
	  	//개인정보 수정
  		@GetMapping("/mypage/edit.do")
  		public String edit(HttpSession sess, Model model) {
  			UserVO uv = (UserVO)sess.getAttribute("login");
  			model.addAttribute("vo", service.detail(uv));
  			return "mypage/edit";
  		}
  		
  		@PostMapping("/mypage/update.do")
  		public String update(UserVO vo, Model model) {
  			int r = service.update(vo);
  			String msg = "";
  			String url = "edit.do";
  			if (r > 0) {
  				msg = "정상적으로 수정되었습니다.";
  			} else {
  				msg = "수정 오류";
  			}
  			model.addAttribute("msg",msg);
  			model.addAttribute("url",url);
  			return "common/alert";
	  		}
  		
  		
  		// 비밀번호 확인 페이지로 이동
  	    @GetMapping("/mypage/verifyPassword.do")
  	    public String showVerifyPasswordPage() {
  	        return "mypage/verifyPassword";
  	    }

  	    // 비밀번호 확인 후 수정 페이지로 이동
  	    @PostMapping("/mypage/verifyPassword.do")
  	    public String verifyPassword(@RequestParam("userid") String userid,
  	                                 @RequestParam("pwd") String pwd,
  	                                 HttpSession sess, Model model) {
  	        UserVO vo = new UserVO();
  	        vo.setUserid(userid);
  	        vo.setPwd(pwd);
  	        int count = service.verifyPassword(vo);
  	        if (count > 0) {
  	            return "redirect:/mypage/edit.do";
  	        } else {
  	            model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
  	            model.addAttribute("url", "/mypage/verifyPassword.do");
  	            return "common/alert";
  	        }
  	    }
  	}
  		

	
	

