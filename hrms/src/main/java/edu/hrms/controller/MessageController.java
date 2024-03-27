package edu.hrms.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/message")
public class MessageController {
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main() {
		
		return "/message/main";
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String write() {
		
		return "/message/write";
	}
	
	@RequestMapping(value = "/receiverPlus.do", method = RequestMethod.GET)
	public Map<String, Object> receiverPlus() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		return map;
	}
	
}
