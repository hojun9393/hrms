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

		UserVO loginUser = (UserVO) authentication.getPrincipal();

		String username = loginUser.getUserid();
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append("<script>alert('" + username + "님 환영합니다.');location.href='" + request.getContextPath() + "'</script>");
		response.getWriter().flush();

	}

}
