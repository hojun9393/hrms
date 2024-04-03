package edu.hrms.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.hrms.service.VacaService;
import edu.hrms.service.WorkService;
import edu.hrms.util.CalcCalendar;
import edu.hrms.vo.UserVO;
import edu.hrms.vo.VacaVO;
import edu.hrms.vo.WorkVO;

@Controller
public class HomeController {
	
	@Autowired
	WorkService workService;
	
	@Autowired
	VacaService vacaService;
	
	@Autowired
	CalcCalendar calcCalendar;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Authentication authentication) {
		UserVO login = (UserVO)authentication.getPrincipal();
		
		// 근무 //////////////////////////////////////////////
		Map<String, String> map = new HashMap<>();
		String userid = login.getUserid();
		String today = calcCalendar.getTodayDate();
		map.put("userid", userid);
		map.put("today", today);
		
		WorkVO vo = workService.selectMyWork(map);
		if(vo!=null) {
			model.addAttribute("start", vo.getStart());
			model.addAttribute("end", vo.getEnd());
		}
		Map<String, String> workTimeMap = workService.getWorkTimeMap(userid);
		String myThisWeekTotalWorkTimePlusMyTotalOvertimeTime 
			= workService.selectMyThisWeekTotalWorkTimePlusMyTotalOvertimeTime(workService.selectMyThisWeekTotalWorkTime(workTimeMap)
																		, workService.selectMyThisWeekTotalOvertimeTime(workTimeMap));
		model.addAttribute("today", today);
		model.addAttribute("myThisWeekTotalWorkTimePlusMyTotalOvertimeTime", myThisWeekTotalWorkTimePlusMyTotalOvertimeTime);
		
		// 연차 //////////////////////////////////////////////
		// 로그인 한 회원
		Map<String, Integer> user = vacaService.myRemainVaca(userid);
		model.addAttribute("user", user);
		// 달력에 연차 표시
		List<VacaVO> list = vacaService.selectApprovedVacaList_all();
		model.addAttribute("list", list);
		
		
		
		return "home";
	}
	
	@RequestMapping(value = "/logoutOk.do", method = RequestMethod.GET)
	public void logout(HttpServletResponse response, Model model) throws IOException {
		
		response.getWriter().append("<script>alert('로그아웃 되었습니다.');location.href='login.do'</script>");
		response.getWriter().flush();
	}
	
}
