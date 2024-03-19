package edu.hrms.controller;

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
	
}

