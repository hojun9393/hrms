package edu.hrms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.hrms.service.UserService;
import edu.hrms.util.RegEx;
import edu.hrms.vo.EmployeeVO;
import edu.hrms.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	@Qualifier("passwordEncoder")
	private PasswordEncoder encoder;
	
	
	@RequestMapping(value = "/main.do" , method = RequestMethod.GET)
	public String main(Authentication authentication, Model model) {
		UserVO userVO = (UserVO)authentication.getPrincipal();
		List<EmployeeVO> list = userService.selectUserAll();
		String joinDate = userVO.getJoinDate().replace("T", " ");
		userVO.setJoinDate(joinDate);
		
		model.addAttribute("list", list);
		model.addAttribute("loginUser", userVO);
		return "/user/main";
	}
	
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String modify(Authentication authentication, Model model) {
		UserVO userVO = (UserVO)authentication.getPrincipal();
		String joinDate = userVO.getJoinDate().replace("T", " ");
		userVO.setJoinDate(joinDate);
		
		model.addAttribute("loginUser", userVO);
		return "/user/modify";
	}
	
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public void modify(Authentication authentication, EmployeeVO employee, 
			String newPassword, String newPasswordChk, RedirectAttributes rttr, HttpServletResponse res) throws IOException {
		UserVO userVO = (UserVO)authentication.getPrincipal();
		employee.setUserid(userVO.getUserid());
        String pw = userVO.getPassword();
	        if(encoder.matches(employee.getPassword(), pw)) {
	        	System.out.println("현재 비밀번호 검증 완료");
	        	if(encoder.matches(newPassword, pw)) {
	        		System.out.println("새 비밀번호 검증 완료");
	        		res.getWriter().append("<script>alert('이전에 사용했던 비밀번호와 같습니다. \\n새로운 비밀번호를 입력해 주세요.');location.href='modify.do'</script>");
	        	}else {
		        	RegEx regEx = new RegEx();
		    		String pwChk = regEx.checkRegEx(RegEx.MPW_REGEX, newPassword);
		    		String phoneChk = regEx.checkRegEx(RegEx.MPHONE_REGEX, employee.getPhone());
		    		String emailChk = regEx.checkRegEx(RegEx.MEMAIL_REGEX, employee.getEmail());
		    		if(pwChk!=null && phoneChk!=null && emailChk!=null) {
		    			String encodedPassword = encoder.encode(pwChk);
		    			employee.setPassword(encodedPassword);
		    			String phone = employee.getPhone().replaceAll("-", "");
		    			employee.setPhone(phone);
		    			int result = userService.updateUser(employee);
		    			
		    			if(result>0) {
			        		userVO.setPassword(encodedPassword);
			    			res.getWriter().append("<script>alert('내 정보 수정이 완료 되었습니다.');location.href='main.do'</script>");
			    		}else {
			    			res.getWriter().append("<script>alert('내 정보 수정이 완료 되지않았습니다. \\n관리자에게 문의하세요.');location.href='main.do'</script>");
			    		}
		    		}else {
		    			res.getWriter().append("<script>alert('내 정보 수정이 완료 되지않았습니다. \\n입력정보를 확인해 주세요.');location.href='main.do'</script>");
		    		}
	        	}
	        }else {
	        	System.out.println("현재 비밀번호 검증 실패");
	        	res.getWriter().append("<script>alert('현재 비밀번호를 다시 확인해 주세요.');location.href='modify.do'</script>");
	        }
	}
	
	@RequestMapping(value = "/regist.do", method = RequestMethod.GET)
	public String regist(Authentication authentication, Model model) {
		UserVO userVO = (UserVO)authentication.getPrincipal();
		String joinDate = userVO.getJoinDate().replace("T", " ");
		userVO.setJoinDate(joinDate);
		
		model.addAttribute("loginUser", userVO);
		return "/user/regist";
	}
	
	@RequestMapping(value = "/modifyAdmin.do", method = RequestMethod.GET)
	public String modifyAdmin(Authentication authentication, Model model) {
		UserVO userVO = (UserVO)authentication.getPrincipal();
		String joinDate = userVO.getJoinDate().replace("T", " ");
		userVO.setJoinDate(joinDate);
		
		model.addAttribute("loginUser", userVO);
		return "/user/modifyAdmin";
	}
	
}
