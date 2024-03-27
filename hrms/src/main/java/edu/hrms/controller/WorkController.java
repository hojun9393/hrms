package edu.hrms.controller;

import java.io.IOException;
import java.time.LocalDate;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.hrms.service.WorkService;
import edu.hrms.util.CalcCalendar;
import edu.hrms.vo.OvertimeSignVO;
import edu.hrms.vo.OvertimeVO;
import edu.hrms.vo.PagingVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.UserVO;
import edu.hrms.vo.WorkVO;

@Controller
@RequestMapping(value = "/work")
public class WorkController {

	@Autowired
	WorkService workService;
	
	@Autowired
	CalcCalendar calcCalendar;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model, Authentication authentication) {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		
		Map<String, String> map = new HashMap<>();
		String userid = login.getUserid();
		String today = calcCalendar.getTodayDate();
		
		model.addAttribute("today", today);
		
		map.put("userid", userid);
		map.put("today", today);
		
		WorkVO vo = workService.selectMyWork(map);

		if(vo!=null) {
			model.addAttribute("start", vo.getStart());
			model.addAttribute("end", vo.getEnd());
		}
		
		Map<String, String> workTimeMap = calcCalendar.getFirstLastDays(today);
		workTimeMap.put("userid",userid);
		String myThisWeekTotalWorkTime = workService.selectMyThisWeekTotalWorkTime(workTimeMap);
		String myThisWeekTotalOvertimeTime = workService.selectMyThisWeekTotalOvertimeTime(workTimeMap);
		
		Map<String, String> myTotalWorkTimeMap = new HashMap<>();
		myTotalWorkTimeMap.put("workTime", myThisWeekTotalWorkTime);
		myTotalWorkTimeMap.put("overtimeTime", myThisWeekTotalOvertimeTime);
		
		String myThisWeekTotalWorkTimePlusMyTotalOvertimeTime = workService.myThisWeekTotalWorkTimePlusMyTotalOvertimeTime(myTotalWorkTimeMap);
		
		model.addAttribute("myThisWeekTotalOvertimeTime", myThisWeekTotalOvertimeTime);
		model.addAttribute("myThisWeekTotalWorkTimePlusMyTotalOvertimeTime", myThisWeekTotalWorkTimePlusMyTotalOvertimeTime);
		
		Map<String, Object> listMap = new HashMap<>();
		String startDate = null;
		String endDate = calcCalendar.getTodayDate();
		listMap.put("userid", userid);
		listMap.put("startDate", startDate);
		listMap.put("endDate", endDate);
		
		List<WorkVO> workList = workService.selectAllMyWork(listMap);
		model.addAttribute("workList", workList); // 로그인 한 사원 근무 리스트
		
		List<OvertimeVO> overtimeList = workService.selectAllMyOvertime(listMap);
		model.addAttribute("overtimeList", overtimeList); // 로그인 한 사원 초과근무 리스트
		
		OvertimeVO ovoAfternoon = workService.overtimeApplicationTodayAfternoon(map);
		OvertimeVO ovoEvening = workService.overtimeApplicationTodayEvening(map);
		model.addAttribute("isOvertimeApplicationTodayAfternoon", ovoAfternoon);
		model.addAttribute("isOvertimeApplicationTodayEvening", ovoEvening);
		
		Map<String, Object> allWorkListMap = new HashMap<>();
		allWorkListMap.put("dept", login.getDept());
		allWorkListMap.put("startDate", startDate);
		allWorkListMap.put("endDate", endDate);
		int cnt = workService.getCountOfAllWorkList(allWorkListMap);
		
		PagingVO pagingVO = new PagingVO(1, cnt, 5);
		allWorkListMap.put("pagingVO",pagingVO);
		
		List<WorkVO> allWorkList = workService.selectAllWork(allWorkListMap);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("allWorkList", allWorkList);
		
		return "/work/main";
	}
	
	
	@RequestMapping(value = "/workInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public Object workInsert(String dateStr, String timeStr, String goOrLeave, Authentication authentication) {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		
		Map<String, String> map = new HashMap<>();
		map.put("userid", login.getUserid());
		map.put("date", dateStr);
		map.put("nowTime", timeStr);
		
		if(goOrLeave.equals("GO")) {
			workService.insert(map);
			
		}else if(goOrLeave.equals("LEAVE")) {
			String today = calcCalendar.getTodayDate();
			map.put("today", today);
			OvertimeVO ovoAfternoon = workService.overtimeApplicationTodayAfternoon(map);
			OvertimeVO ovoEvening = workService.overtimeApplicationTodayEvening(map);
			if(ovoAfternoon==null && ovoEvening==null) {
				workService.update(map);
				return "SUCCESS";
			}
			
			boolean isLeaveAfterEndtimeAfternoon = false;
			boolean isLeaveAfterEndtimeEvening = false;
			String[] afternoon = null;
			String[] evening = null;
			if(ovoAfternoon!=null) {
				afternoon = new String[2];
				String endTimeAfternoon = ovoAfternoon.getDate()+" "+ovoAfternoon.getEnd();
				isLeaveAfterEndtimeAfternoon = calcCalendar.compareDatetime(endTimeAfternoon);
				afternoon[0] = ovoAfternoon.getStart().split(":")[0];
				afternoon[1] = ovoAfternoon.getEnd().split(":")[0];
			}
			if(ovoEvening!=null) {
				evening = new String[2];
				String endTimeEvening = ovoEvening.getDate()+" "+ovoEvening.getEnd();
				isLeaveAfterEndtimeEvening = calcCalendar.compareDatetime(endTimeEvening);
				evening[0] = ovoEvening.getStart().split(":")[0];
				evening[1] = ovoEvening.getEnd().split(":")[0];
			}
			
			if(isLeaveAfterEndtimeAfternoon && isLeaveAfterEndtimeEvening) {
				
				workService.update(map);
				// 수정 필요
				
			}else {
				Map<String, String[]> endtimeMessage = new HashMap<>();
				endtimeMessage.put("afternoon", afternoon);
				endtimeMessage.put("evening", evening);
				return endtimeMessage;
			}
		}
		return "SUCCESS";
	}
	
	@RequestMapping(value = "/updateOvertime.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean updateOvertime(String dateStr, Authentication authentication) {
		UserVO login = (UserVO)authentication.getPrincipal();
		
		Map<String, String> map = new HashMap<>();
		map.put("userid", login.getUserid());
		map.put("date", dateStr);
		map.put("nowTime", calcCalendar.getNowTime());
		workService.update(map);
		map.put("today", calcCalendar.getTodayDate());
		
		OvertimeVO ovoAfternoon = workService.overtimeApplicationTodayAfternoon(map);
		OvertimeVO ovoEvening = workService.overtimeApplicationTodayEvening(map);
		
		// 점심 초과근무
		if(ovoAfternoon!=null) {
			String startTimeAfternoon = ovoAfternoon.getDate()+" "+ovoAfternoon.getStart();
			boolean isLeaveBeforeStarttimeAfternoon = calcCalendar.compareDatetimeBefore(startTimeAfternoon);
		}
		
		// 저녁 초과근무
		if(ovoEvening!=null) {
			String startTimeEvening = ovoEvening.getDate()+" "+ovoEvening.getStart();
			boolean isLeaveBeforeStarttimeEvening = calcCalendar.compareDatetimeBefore(startTimeEvening);
			if(isLeaveBeforeStarttimeEvening) {
				// 초과근무 시작시간 전에 퇴근하는 경우
				
				// 초과근무 철회 로직
				workService.withdrawal(ovoEvening.getOvertimeNo());
				workService.overtimesignDelete(ovoEvening.getOvertimeNo());
				workService.update(map);
			}else {
				// 초과근무 시작시간 후에 퇴근하는 경우
				
				// 초과근무 끝나는 시간 현재 시간으로 업데이트 로직
				
			}
		}
		workService.updateOvertime(map);
		
		return false;
		
		
		
	}
	
	@RequestMapping(value = "/overtime_application.do", method = RequestMethod.GET)
	public String overtimeApplication(Model model, Authentication authentication) {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		
		Map<String, Object> signLineMap = workService.getSignLineMap(login.getUserid(), login.getPosition());
		List<SignLineVO> signLineList = workService.getSignLineList(signLineMap);
		
		model.addAttribute("signLineList", signLineList);
		
		return "/work/overtime_application";
	}
	
	@RequestMapping(value = "/overtime_application.do", method = RequestMethod.POST)
	public void overtimeApplication(HttpServletResponse response, String date, String start, String end, String content, Authentication authentication) throws IOException {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		
		Map<String, String> map = new HashMap<>();
		String userid = login.getUserid();
		map.put("userid", userid);
		map.put("date", date);
		map.put("start", start);
		map.put("end", end);
		map.put("content", content);
		
		workService.insertOvertime(map);
		int overtimeNo = workService.getMaxNoByUserId(userid);
		
		String myPosition = login.getPosition();
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
			workService.overtimesignDelete(overtimeNo);
			response.getWriter().append("<script>alert('초과근무 신청이 철회되었습니다.');location.href='main.do';</script>");
		}else {
			response.getWriter().append("<script>alert('결재 진행중인 초과근무 신청은 철회할 수 없습니다.');location.href='main.do';</script>");
		}
		response.getWriter().flush();
	}
	
	
	
	@RequestMapping(value = "/reloadList.do")
	@ResponseBody
	public Object reloadList(String startDate, String endDate, String obj, String searchInput, String pNum, Authentication authentication) {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		
		Map<String, Object> listMap = new HashMap<>();
		listMap.put("userid", login.getUserid());
		listMap.put("startDate", startDate);
		if(endDate==null || endDate.equals("")) {
			endDate = calcCalendar.getTodayDate();
		}
		listMap.put("endDate", endDate);
		
		List<?> list = new ArrayList<>();
		if(obj.equals("1")) {
			list = workService.selectAllMyWork(listMap);
		}else if(obj.equals("2")) {
			list = workService.selectAllMyOvertime(listMap);
		}else if(obj.equals("3")) {
			listMap.put("dept", login.getDept());
			listMap.put("searchInput", searchInput);
			int cnt = workService.getCountOfAllWorkList(listMap);
			PagingVO pagingVO = new PagingVO(Integer.parseInt(pNum), cnt, 5);
			listMap.put("pagingVO", pagingVO);
			
			list = workService.selectAllWork(listMap);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("pagingVO", pagingVO);
			return map;
		}
		
		return list;
	}

	
	
	
}
