package edu.hrms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.hrms.service.UserService;
import edu.hrms.vo.EmployeeVO;
import edu.hrms.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
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
	public String modify(Authentication authentication, String password) {
		UserVO userVO = (UserVO)authentication.getPrincipal();
		
		System.out.println(userVO.getPassword()+"  "+password);
		return "/user/modify";
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
