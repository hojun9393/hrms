package edu.hrms.controller;

import java.io.IOException;
import java.util.ArrayList;
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

import edu.hrms.service.SignService;
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
	
	@Autowired
	SignService signService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Authentication authentication) {
		UserVO login = (UserVO)authentication.getPrincipal();
		
		// �ٹ� //////////////////////////////////////////////
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
		String myThisWeekTotalWorkTime
			= workService.selectMyThisWeekTotalWorkTime(workService.selectMyThisWeekWorkTime(workTimeMap)
														, workService.selectMyThisWeekOvertimeTime(workTimeMap));
		model.addAttribute("today", today);
		model.addAttribute("myThisWeekTotalWorkTime", myThisWeekTotalWorkTime);
		
		/////////////////// ���� ///////////////////
		// �α��� �� ȸ��
		Map<String, Integer> user = vacaService.myRemainVaca(userid);
		model.addAttribute("user", user);
		
		// �޷¿� ǥ���� ������ ����Ʈ
		Map<String, Object> listMap = Map.of("array", new int[] {2,7});
		List<VacaVO> list = vacaService.selectAllVacaList(listMap);
		
		// ���� ������ ����Ʈ
		List<VacaVO> todayList = new ArrayList<>();
		for(VacaVO data : list) {
			boolean b = calcCalendar.isParam1BetweenParam2AndParam3_date
						(today, data.getStartDate(), data.getEndDate());
			if(b) {
				todayList.add(data);
			}
		}
		
		//���� ��� ���� ���� ����
		int userId = Integer.parseInt(userid);
		int docSignCount = signService.selectDocSignCount(userId);
		int vacaSignCount = signService.selectVacaSignCount(userId);
		int overSignCount = signService.selectOverSignCount(userId);
		
		model.addAttribute("list", list);
		model.addAttribute("todayList", todayList);
		model.addAttribute("docSignCount", docSignCount);
		model.addAttribute("vacaSignCount", vacaSignCount);
		model.addAttribute("overSignCount", overSignCount);
		
		return "home";
	}
	
	@RequestMapping(value = "/logoutOk.do", method = RequestMethod.GET)
	public void logout(HttpServletResponse response, Model model) throws IOException {
		
		response.getWriter().append("<script>alert('�α׾ƿ� �Ǿ����ϴ�.');location.href='login.do'</script>");
		response.getWriter().flush();
	}
	
}
