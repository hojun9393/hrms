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
import org.springframework.web.bind.annotation.RequestParam;
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
	public String main(Model model, String selMenu) {
		
		Map<String, String> map = new HashMap<>();
		String userid = "10001";
		LocalDate nowData = LocalDate.now();
		String now = nowData.toString();
		
		model.addAttribute("today", now);
		
		map.put("userid", userid);
		map.put("now", now);
		
		WorkVO vo = workService.selectMyWork(map);

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
		
		List<WorkVO> workList = workService.selectAllMyWork(listMap);
		model.addAttribute("workList", workList);
		List<OvertimeVO> overtimeList = workService.selectAllOvertime(listMap);
		model.addAttribute("overtimeList", overtimeList);
		
		int count = workService.isOvertimeApplicationToday(map);
		model.addAttribute("isOvertimeApplicationToday", count);
		
		model.addAttribute("selMenu", selMenu);
		
		
		
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
	
	@RequestMapping(value = "/overtime_application.do", method = RequestMethod.GET)
	public String overtimeApplication(Model model) {
		
		String userid = "10001";
		String position = "E";
		
		Map<String, Object> signLineMap = workService.getSignLineMap(userid, position);
		List<SignLineVO> signLineList = workService.getSignLineList(signLineMap);
		
		model.addAttribute("signLineList", signLineList);
		
		return "/work/overtime_application";
	}
	
	@RequestMapping(value = "/overtime_application.do", method = RequestMethod.POST)
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
		
		response.getWriter().append("<script>alert('초과근무 신청이 완료되었습니다.');location.href='main.do';</script>");
		response.getWriter().flush();
	}
	
	@RequestMapping(value = "/overtime_view.do")
	public String overtimeView(Model model, @RequestParam("no")int overtimeNo) {
		
		OvertimeVO ovo = workService.selectOvertime(overtimeNo);
		model.addAttribute("ovo", ovo);
		List<OvertimeSignVO> osList = workService.getOvertimeSignList(overtimeNo);
		boolean returningFlag = false;
		for(OvertimeSignVO data : osList) {
			if(data.getPrev_state()==2 && data.getState()==0) {
				data.setState(1);
			}
			if(returningFlag) {
				data.setState(9);
			}
			if(data.getPrev_state()==3) {
				data.setState(9);
				returningFlag = true;
			}
		}
		model.addAttribute("osList", osList);
		
		int count = 0;
		String nowState = "대기";
		for(OvertimeSignVO data : osList) {
			if(data.getState()==2) {
				count++;
				nowState = "진행";
			}else if(data.getState()==3) {
				nowState = "반려";
				break;
			}
		}
		if(ovo.getState().equals("9")) {
			nowState = "철회";
		}
		model.addAttribute("count", count);
		model.addAttribute("nowState", nowState);
		
		return "/work/overtime_view";
	}
	
	@RequestMapping(value = "/withdrawal.do", method = RequestMethod.POST)
	public void withdrawal(HttpServletResponse response, int overtimeNo) throws IOException {
		
		OvertimeVO vo = workService.selectOvertime(overtimeNo);
		
		if(vo.getState().equals("0")) {
			workService.withdrawal(overtimeNo);
			workService.overtimeDelete(overtimeNo);
			response.getWriter().append("<script>alert('초과근무 신청이 철회되었습니다.');location.href='main.do';</script>");
		}else {
			response.getWriter().append("<script>alert('결재 진행중인 초과근무 신청은 철회할 수 없습니다.');location.href='main.do';</script>");
		}
		response.getWriter().flush();
	}
	
	
	
	@RequestMapping(value = "/reloadList.do")
	@ResponseBody
	public List<?> reloadList(String startDate, String endDate, String obj) {
		
		String userid="10001";
		Map<String, String> listMap = new HashMap<>();
		listMap.put("userid", userid);
		listMap.put("startDate", startDate);
		if(endDate==null || endDate.equals("")) {
			endDate = calcCalendar.getTodayDate();
		}
		listMap.put("endDate", endDate);
		
		List<?> list = new ArrayList<>();
		if(obj.equals("1")) {
			list = workService.selectAllMyWork(listMap);
		}else if(obj.equals("2")) {
			list = workService.selectAllOvertime(listMap);
		}
		
		return list;
	}
	
	
	
	
	
}
