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
		case "D" : dept = "���ߺ�"; break;
		case "S" : dept = "������"; break;
		case "P" : dept = "��ȹ��"; break;
		case "H" : dept = "�λ��"; break;
		}
		String position = login.getPosition();
		switch(position) {
			case "C" : position = "��ǥ"; break;
			case "D" : position = "����"; break;
			case "L" : position = "����"; break;
			case "E" : position = "���"; break;
			case "A" : position = "������"; break;
		}
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append("<script>alert('"+dept+" "+name+" "+position+"�� ȯ���մϴ�.');location.href='" + request.getContextPath() + "'</script>");
		response.getWriter().flush();

	}

}
