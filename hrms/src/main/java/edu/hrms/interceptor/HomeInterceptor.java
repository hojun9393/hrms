package edu.hrms.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class HomeInterceptor implements HandlerInterceptor {

	/*
	 * 1. dispatcher servlet�� controller ���̿��� �����Ѵ�.
	 * 2. ������ dispatcher servlet�� bean�� ��� ������ �����ϴ�.
	 * 3. ����/�ΰ� � ���õ� ���� �۾� ��ġ
	 * 4. controller�� �Ѱ��ִ� ������ ���� ó�� ��ġ
	 * 5. api ȣ�⿡ ���� �α� �Ǵ� ���� ó�� ��ġ
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//1.������ ��Ʈ�ѷ� ���� ������ ȣ��Ǿ� ���۵Ǵ� �޼ҵ� (�ΰ�/���� ó��)
		//2.handle ��ü�� ������ ��Ʈ�ѷ� �ľ� �Ǵ� ���� �޼ҵ� ���� ����
		//3.���� Ÿ�� boolean�� true�̸� ���� �۾� ���� false�̸� ���� �۾� �ߴ�
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		//1. ������ ��Ʈ�ѷ� ���� ���Ŀ� ó���ϸ�, dispatcherservlet�� ȭ���� ó���ϱ� ���� ����
		//2. modelAndView�� ����ϸ� ��Ʈ�ѷ����� ���� model��ü�� �����͸� ������ ���ִ�.
		String command = request.getRequestURI().substring(request.getContextPath().length()+1);
		String[] uris = command.split("/");

		String navSelected = "";
		if(uris[0].equals("")) {
			navSelected = "home";
		}else if(uris[0].equals("work")) {
			navSelected = "work";
		}else if(uris[0].equals("vaca")) {
			navSelected = "vaca";
		}else if(uris[0].equals("docu")) {
			navSelected = "docu";
		}else if(uris[0].equals("sign")) {
			navSelected = "sign";
		}else if(uris[0].equals("work")) {
			navSelected = "work";
		}else if(uris[0].equals("user")) {
			navSelected = "user";
		}else if(uris[0].equals("notice")) {
			navSelected = "notice";
		}
		
		modelAndView.addObject("navSelected", navSelected);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//1.dispatcher servlet�� ȭ�� ó���� �� ���� �� ����
	}

}
