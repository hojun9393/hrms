package edu.hrms.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.hrms.service.SignService;
import edu.hrms.vo.SignVO;

@Controller
@RequestMapping(value = "/sign")
public class SignController {

	@Autowired
	SignService signService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		SignVO vo = new SignVO();
		vo.setDocVO(signService.selectAllDoc());
		vo.setVacaVO(signService.selectAllVaca());
		vo.setOverVO(signService.selectAllOver());
		model.addAttribute("list", vo);
		
		return "/sign/main";
	}
	
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public String view() {
		
		return "/sign/view";
	}
	 
	
}

