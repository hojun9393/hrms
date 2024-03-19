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
		
		System.out.println(loginUser.getUserid());
		
		// �α��� ����
		System.out.println("�α��� ����!!");
		response.sendRedirect(request.getContextPath());
		
	}

	
	
	
}
