package edu.hrms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.authentication.AccountExpiredException;

public class UserLoginFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		System.out.println("UserLoginFailureHandler 들어옴");
		System.out.println(exception);
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		
		String msg = "사원번호와 아이디를 확인해주세요.";
		
		// 넘어온 예외에 따른 처리
		if(exception instanceof LockedException) {
			msg = "휴직중인 사원은 로그인할 수 없습니다.";
		}
		if(exception instanceof AccountExpiredException) {
			msg = "퇴직한 사원입니다.";
		}
		
		response.getWriter().append("<script>alert('"+msg+"'); location.href='login.do';</script>");
		response.getWriter().flush();
		
	}

}
