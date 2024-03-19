package edu.hrms.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.hrms.service.WorkService;
import edu.hrms.util.CalcCalendar;
import edu.hrms.vo.WorkVO;

@Controller
@RequestMapping(value = "/work")
public class WorkController {

	@Autowired
	WorkService workService;
	
	@Autowired
	CalcCalendar calCalendar;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model) {
		
		Map<String, String> map = new HashMap<>();
		String userid = "10001";
		LocalDate nowData = LocalDate.now();
		String now = nowData.toString();
		
		map.put("userid", userid);
		map.put("now", now);
		
		WorkVO vo = workService.selectStart(map);

		if(vo!=null) {
			model.addAttribute("start", vo.getStart());
			model.addAttribute("end", vo.getEnd());
		}
		
		int thisWeek = calCalendar.getWeekOfYear(now);
		
		System.out.println(thisWeek);
		
		
		return "/work/main";
	}
	
	
	@RequestMapping(value = "/workInsert.do", method = RequestMethod.GET)
	@ResponseBody
	public String workInsert(String dateStr, String timeStr, String goOrLeave) {
		
		Map<String, String> map = new HashMap<>();
		String userid = "10001";
		map.put("userid", userid);
		map.put("date", dateStr);
		map.put("time", timeStr);
		
		if(goOrLeave.equals("GO")) {
			workService.insert(map);
		}else if(goOrLeave.equals("LEAVE")) {
			workService.update(map);
		}
		
		return "ajax success";
	}
	
	
	
	
	
	
	
	
	
	
	
}
