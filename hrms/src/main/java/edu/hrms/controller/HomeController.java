package edu.hrms.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.hrms.vo.UserVO;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Authentication authentication) {
		UserVO vo = (UserVO)authentication.getPrincipal();
		
		return "home";
	}
	
	@RequestMapping(value = "/logoutOk.do", method = RequestMethod.GET)
	public void logout(HttpServletResponse response, Model model) throws IOException {
		
		response.getWriter().append("<script>alert('로그아웃 되었습니다.');location.href='login.do'</script>");
		response.getWriter().flush();
	}
	
}
