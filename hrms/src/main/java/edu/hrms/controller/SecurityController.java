package edu.hrms.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SecurityController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/security/login.do")
	public String login() {
		return "security/login";
	}
	
	@RequestMapping(value="/security/loginOk.do")
	public void loginOk(String userid, String password) {
		
		
		
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "security/join";
	}
	
	@RequestMapping(value="/joinOk.do", method=RequestMethod.POST)
	public String joinOk(String userid, String password, String name ,String authority) {
		
		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder();
		
		Map<String,Object> vo = new HashMap<String,Object>();
		vo.put("userid", userid);
		vo.put("password",epwe.encode(password));
		vo.put("name", name);
		vo.put("authority", authority);
		
//		int result = sqlSession.insert("edu.springboard.mapper.userMapper.insert",vo);
		return "redirect:/security/login.do";
	}
}
