package edu.hrms.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.hrms.service.WorkService;

@Controller
@RequestMapping(value = "/work")
public class WorkController {

	@Autowired
	WorkService workService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model) {
		return "/work/main";
	}
	
	
	@RequestMapping(value = "/goToWork.do", method = RequestMethod.GET)
	@ResponseBody
	public String goToWork(String dateStr, String startStr) {
		
		Map<String, String> map = new HashMap<>();
		map.put("date", dateStr);
		map.put("start", startStr);
		
		int result = workService.insert(map);
		
		return "ajax success";
	}
	
}
