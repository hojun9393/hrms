package edu.hrms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/sign")
public class SignController {

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main() {
		
		return "/sign/main";
	}
	
	/*
	 * @Autowired BoardService boardService;
	 * 
	 * @RequestMapping(value="/index.do", method=RequestMethod.GET) public String
	 * index(Model model,HttpSession session,HttpServletResponse
	 * response,HttpServletRequest request) throws IOException {
	 * 
	 * String filterData = (String)request.getAttribute("filterData");
	 * 
	 * System.out.println("filterData::"+filterData);
	 * 
	 * List<BoardVO> list = boardService.selectAll();
	 * 
	 * model.addAttribute("list", list);
	 * 
	 * return "board/list"; }
	 */
	
}

