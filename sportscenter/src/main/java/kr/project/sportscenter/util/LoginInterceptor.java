
package kr.project.sportscenter.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.project.sportscenter.user.UserVO;


public class LoginInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, 
							HttpServletResponse response, 
							Object handler)
							throws Exception {
		HttpSession sess = request.getSession();
		UserVO login = (UserVO)sess.getAttribute("login");
		if (login == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 후 사용가능합니다.');");
			out.print("location.href='/user/login.do';");
			out.print("</script>");
			out.close();
			return false; // 못가 
		}
		return true; // 가던길가
	}
}
