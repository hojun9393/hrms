package edu.hrms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import edu.hrms.vo.UserVO;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		UserVO login = (UserVO) authentication.getPrincipal();

		String name = login.getName();
		String dept = login.getDept();
		switch(dept) {
		case "M" : dept = ""; break;
		case "D" : dept = "개발부"; break;
		case "S" : dept = "영업부"; break;
		case "P" : dept = "기획부"; break;
		case "H" : dept = "인사부"; break;
		}
		String position = login.getPosition();
		switch(position) {
			case "C" : position = "대표"; break;
			case "D" : position = "부장"; break;
			case "L" : position = "팀장"; break;
			case "E" : position = "사원"; break;
			case "A" : position = "관리자"; break;
		}
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append("<script>alert('"+dept+" "+name+" "+position+"님 환영합니다.');location.href='" + request.getContextPath() + "'</script>");
		response.getWriter().flush();

	}

}
