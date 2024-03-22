package edu.hrms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.hrms.service.NoticeService;

@Controller
@RequestMapping(value ="/notice")
public class NoticeController {		
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String notice(Model model) {
				
		return "/notice/main";
	}
	
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public String view() {
		
		return "/notice/view";
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String write() {
		
		return "/notice/write";
	}
}