package edu.hrms.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.hrms.service.WorkService;
import edu.hrms.util.CalcCalendar;
import edu.hrms.vo.OvertimeSignVO;
import edu.hrms.vo.OvertimeVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.WorkVO;

@Controller
@RequestMapping(value = "/work")
public class WorkController {

	@Autowired
	WorkService workService;
	
	@Autowired
	CalcCalendar calcCalendar;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model) {
		
		Map<String, String> map = new HashMap<>();
		String userid = "10001";
		LocalDate nowData = LocalDate.now();
		String now = nowData.toString();
		
		map.put("userid", userid);
		map.put("now", now);
		
		WorkVO vo = workService.select(map);

		if(vo!=null) {
			model.addAttribute("start", vo.getStart());
			model.addAttribute("end", vo.getEnd());
		}
		
		Map<String, String> workTimeMap = calcCalendar.getFirstLastDays(now);
		workTimeMap.put("table","work");
		String workTime = workService.selectThisWeek(workTimeMap);
		workTimeMap.put("table","overtime");
		String overtimeTime = workService.selectThisWeek(workTimeMap);
		model.addAttribute("workTime", workTime);
		model.addAttribute("overtimeTime", overtimeTime);
		
		Map<String, String> listMap = new HashMap<>();
		String startDate = null;
		String endDate = null;
		listMap.put("userid", userid);
		listMap.put("startDate", startDate);
		if(endDate==null) {
			endDate = calcCalendar.getTodayDate();
		}
		listMap.put("endDate", endDate);
		
		List<WorkVO> workList = workService.selectAllWork(listMap);
		model.addAttribute("workList", workList);
		List<OvertimeVO> overtimeList = workService.selectAllOvertime(userid);
		model.addAttribute("overtimeList", overtimeList);
		
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
	
	@RequestMapping(value = "/overtimeApplication.do", method = RequestMethod.GET)
	public String overtimeApplication() {
		return "/work/overtime_application";
	}
	
	@RequestMapping(value = "/overtimeApplication.do", method = RequestMethod.POST)
	public void overtimeApplication(HttpServletResponse response, String date, String start, String end, String content) throws IOException {
		
		Map<String, String> map = new HashMap<>();
		String userid = "10001";
		map.put("userid", userid);
		map.put("date", date);
		map.put("start", start);
		map.put("end", end);
		map.put("content", content);
		
		workService.insertOvertime(map);
		int overtimeNo = workService.getMaxNoByUserId(userid);
		
		String myPosition = "E";
		String position = "";
		if(myPosition.equals("E")) {
			position = "C,D,L";
		}else if(myPosition.equals("L")) {
			position = "C,D";
		}else if(myPosition.equals("D")) {
			position = "C";
		}
		String[] positionArr = position.split(",");
		
		Map<String, Object> signLineMap = new HashMap<>();
		signLineMap.put("userid", userid);
		signLineMap.put("positionArr", positionArr);
		
		List<SignLineVO> signLineList = workService.getSignLineList(signLineMap);
		
		List<OvertimeSignVO> overtimeSignList = new ArrayList<>();
		
		for(SignLineVO vo : signLineList) {
			OvertimeSignVO ovo = new OvertimeSignVO();
			ovo.setOvertimeNo(overtimeNo);
			ovo.setSignLineNo(vo.getSignLineNo());
			overtimeSignList.add(ovo);
		}
		
		workService.insertOvertimeSign(overtimeSignList);
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		
		response.getWriter().append("<script>alert('초과근무 신청이 완료되었습니다.');location.href='main.do';</script>");
		response.getWriter().flush();
	}
	
	
	@RequestMapping(value = "/reloadList.do")
	@ResponseBody
	public List<WorkVO> reloadList(String startDate, String endDate) {
		
		String userid="10001";
		Map<String, String> listMap = new HashMap<>();
		listMap.put("userid", userid);
		listMap.put("startDate", startDate);
		if(endDate==null || endDate.equals("")) {
			endDate = calcCalendar.getTodayDate();
		}
		listMap.put("endDate", endDate);
		
		List<WorkVO> list = workService.selectAllWork(listMap);
		
		return list;
	}
	
	
	
	
	
}
