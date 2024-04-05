package edu.hrms.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
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
import edu.hrms.vo.SearchVO;
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
	public String main(Model model, Authentication authentication, HttpServletResponse response) {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		
		// �α��� �� ������ �������� ��� ������ �ٹ� �������� �̵�
		if(login.getAuthority().equals("ROLE_ADMIN")) {
			try {
				response.sendRedirect("main_admin.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
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
		
		// �α��� �� ��� �ٹ� �ð� ���
		Map<String, String> workTimeMap = workService.getWorkTimeMap(userid);
		String myThisWeekTotalWorkTime = workService.selectMyThisWeekTotalWorkTime(workTimeMap);
		String myThisWeekTotalOvertimeTime = workService.selectMyThisWeekTotalOvertimeTime(workTimeMap);
		String myThisWeekTotalWorkTimePlusMyTotalOvertimeTime = workService.selectMyThisWeekTotalWorkTimePlusMyTotalOvertimeTime(myThisWeekTotalWorkTime, myThisWeekTotalOvertimeTime);
		model.addAttribute("myThisWeekTotalOvertimeTime", myThisWeekTotalOvertimeTime);
		model.addAttribute("myThisWeekTotalWorkTimePlusMyTotalOvertimeTime", myThisWeekTotalWorkTimePlusMyTotalOvertimeTime);
		
		// �α��� �� ��� �ٹ� ����Ʈ ���
		Map<String, Object> listMap = new HashMap<>();
		String startDate = null;
		String endDate = today;
		listMap.put("userid", userid);
		listMap.put("startDate", startDate);
		listMap.put("endDate", endDate);
		
		List<WorkVO> workList = workService.selectAllMyWork(listMap);
		model.addAttribute("workList", workList);
		
		List<OvertimeVO> overtimeList = workService.selectAllMyOvertime(listMap);
		model.addAttribute("overtimeList", overtimeList);
		
		OvertimeVO ovoAfternoon = workService.overtimeApplicationTodayAfternoon(map);
		OvertimeVO ovoEvening = workService.overtimeApplicationTodayEvening(map);
		model.addAttribute("isOvertimeApplicationTodayAfternoon", ovoAfternoon);
		model.addAttribute("isOvertimeApplicationTodayEvening", ovoEvening);
		
		// ���� �̻� ����� ��ȸ ������ �ٹ�����Ʈ
		if(!login.getAuthority().equals("ROLE_EMPLOYEE")) {
			Map<String, Object> allWorkListMap = new HashMap<>();
			String[] deptArr = workService.getDeptArr(login.getDept());
			allWorkListMap.put("deptArr", deptArr);
			allWorkListMap.put("startDate", startDate);
			allWorkListMap.put("endDate", endDate);
			int cnt = workService.getCountOfAllWorkList(allWorkListMap);
			
			PagingVO pagingVO = new PagingVO(1, cnt, 10);
			allWorkListMap.put("pagingVO",pagingVO);
			
			List<WorkVO> allWorkList = workService.selectAllWork(allWorkListMap);
			model.addAttribute("pagingVO", pagingVO);
			model.addAttribute("allWorkList", allWorkList);
		}
		
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
			return "SUCCESS";
			
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
				// 13:00 �������� ������ ��ƾ���
				boolean before13PM = calcCalendar.isParamBeforeNow(dateStr+" 13:00:00");
				if(before13PM) {
					afternoon = new String[2];
					String endTimeAfternoon = ovoAfternoon.getDate()+" "+ovoAfternoon.getEnd();
					isLeaveAfterEndtimeAfternoon = calcCalendar.compareDatetime(endTimeAfternoon);
					afternoon[0] = ovoAfternoon.getStart().split(":")[0];
					afternoon[1] = ovoAfternoon.getEnd().split(":")[0];
				}else if(ovoEvening==null) {
					workService.update(map);
					return "SUCCESS";
				}
			}
			if(ovoEvening!=null) {
				// �ʰ��ٹ� �� �ð����� ��ٽð�(now)�� ������ ��쿡�� ������ ��ƾ���
				boolean isEndBeforeNow = calcCalendar.isParamBeforeNow(dateStr+" "+ovoEvening.getEnd());
				if(isEndBeforeNow) {
					evening = new String[2];
					String endTimeEvening = ovoEvening.getDate()+" "+ovoEvening.getEnd();
					isLeaveAfterEndtimeEvening = calcCalendar.compareDatetime(endTimeEvening);
					evening[0] = ovoEvening.getStart().split(":")[0];
					evening[1] = ovoEvening.getEnd().split(":")[0];
				}else {
					workService.update(map);
					return "SUCCESS";
				}
			}
			
			if(isLeaveAfterEndtimeAfternoon && isLeaveAfterEndtimeEvening) {
				// ���� �ʰ��ٹ�, ���� �ʰ��ٹ� ���ð����� �ʰ� ��� ��� ���
				// ��ٽð� ������Ʈ �ϰ� ��
				workService.update(map);
				return "SUCCESS";
				
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
	public void updateOvertime(String dateStr, Authentication authentication) {
		UserVO login = (UserVO)authentication.getPrincipal();
		
		Map<String, String> map = new HashMap<>();
		map.put("userid", login.getUserid());
		map.put("nowTime", calcCalendar.getNowTime());
		map.put("date", dateStr);
		map.put("today", dateStr);
		workService.update(map);
		
		OvertimeVO ovoAfternoon = workService.overtimeApplicationTodayAfternoon(map);
		OvertimeVO ovoEvening = workService.overtimeApplicationTodayEvening(map);
		
		// ���� �ʰ��ٹ�
		if(ovoAfternoon!=null) {
			System.out.println("����");
			String startTimeAfternoon = ovoAfternoon.getDate()+" "+ovoAfternoon.getStart();
			boolean isLeaveBeforeStarttimeAfternoon = calcCalendar.isParamBeforeNow(startTimeAfternoon);
			if(isLeaveBeforeStarttimeAfternoon) {
				System.out.println("�ʰ��ٹ� ���� �� ���");
				// �ʰ��ٹ� ���۽ð� ���� ����ϴ� ���
				// �ʰ��ٹ� öȸ, ���ζ��� ���� ����
				workService.withdrawal(ovoAfternoon.getOvertimeNo());
				workService.overtimesignDelete(ovoAfternoon.getOvertimeNo());
			}else {
				System.out.println("�ʰ��ٹ� ���� �� ���");
				// �ʰ��ٹ� ���۽ð� �Ŀ� ����ϴ� ���
				// �ʰ��ٹ� ������ �ð� ���� �ð����� ������Ʈ ����
				
				// ������ 13:00���� �����̳�
				boolean before13PM = calcCalendar.isParamBeforeNow(dateStr+" 13:00:00");
				if(before13PM) {
					// 13:00���� ����
					// �ʰ��ٹ� ������ �ð� ���� �ð����� ������Ʈ
					System.out.println("before13PM");
					map.put("afternoonOrEvening", "afternoon");
					workService.updateOvertime(map);
				}else {
					// 13:00���� ����
					// �ʰ��ٹ� ������ �ð� ������Ʈ�� �ʿ� ����
					System.out.println("after13PM");
					
				}
			}
		}
		
		// ���� �ʰ��ٹ�
		if(ovoEvening!=null) {
			System.out.println("����");
			String startTimeEvening = ovoEvening.getDate()+" "+ovoEvening.getStart();
			boolean isLeaveBeforeStarttimeEvening = calcCalendar.isParamBeforeNow(startTimeEvening);
			if(isLeaveBeforeStarttimeEvening) {
				System.out.println("�ʰ��ٹ� ���� �� ���");
				// �ʰ��ٹ� ���۽ð� ���� ����ϴ� ���
				// �ʰ��ٹ� öȸ, ���ζ��� ���� ����
				workService.withdrawal(ovoEvening.getOvertimeNo());
				workService.overtimesignDelete(ovoEvening.getOvertimeNo());
			}else {
				System.out.println("�ʰ��ٹ� ���� �� ���");
				// �ʰ��ٹ� ���۽ð� �Ŀ� ����ϴ� ���
				// �ʰ��ٹ� ������ �ð� ���� �ð����� ������Ʈ ����
				map.put("afternoonOrEvening", "evening");
				workService.updateOvertime(map);
			}
		}
	}
	
	@RequestMapping(value = "/overtime_application.do", method = RequestMethod.GET)
	public String overtimeApplication(Model model, Authentication authentication) {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		
		List<SignLineVO> signLineList = workService.getSignLineList(login.getUserid(), login.getPosition(), "O");
		
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
		map.put("today", date);
		map.put("start", start);
		map.put("end", end);
		map.put("content", content);
		
		if(start.equals("12:00")) {
			OvertimeVO ovoAfternoon = workService.overtimeApplicationTodayAfternoon(map);
			if(ovoAfternoon!=null) {
				response.getWriter().append("<script>alert('���� �̹� ���� ������� ���� �ʰ��ٹ��� �ֽ��ϴ�.');location.href='main.do';</script>");
			}else {
				workService.insertOvertime(map);
				
				List<SignLineVO> signLineList = workService.getSignLineList(userid, login.getPosition(), "O");
				int overtimeNo = workService.getMaxNoByUserId(userid);
				List<OvertimeSignVO> overtimeSignList = workService.getOvertimeSignList(signLineList, overtimeNo);
				
				workService.insertOvertimeSign(overtimeSignList);
				
				response.getWriter().append("<script>alert('�ʰ��ٹ� ��û�� �Ϸ�Ǿ����ϴ�.');location.href='main.do';</script>");
			}
		}else {
			OvertimeVO ovoEvening = workService.overtimeApplicationTodayEvening(map);
			if(ovoEvening!=null) {
				response.getWriter().append("<script>alert('���� �̹� ���� ������� ���� �ʰ��ٹ��� �ֽ��ϴ�.');location.href='main.do';</script>");
			}else {
				workService.insertOvertime(map);
				
				List<SignLineVO> signLineList = workService.getSignLineList(userid, login.getPosition(), "O");
				int overtimeNo = workService.getMaxNoByUserId(userid);
				List<OvertimeSignVO> overtimeSignList = workService.getOvertimeSignList(signLineList, overtimeNo);
				
				workService.insertOvertimeSign(overtimeSignList);
				
				response.getWriter().append("<script>alert('�ʰ��ٹ� ��û�� �Ϸ�Ǿ����ϴ�.');location.href='main.do';</script>");
			}
		}
		
		response.getWriter().flush();
	}
	
	@RequestMapping(value = "/overtime_view.do")
	public String overtimeView(Model model, @RequestParam("no")int overtimeNo) {
		
		OvertimeVO ovo = workService.selectOvertime(overtimeNo);
		model.addAttribute("ovo", ovo);
		
		// 1. db���� sign ����Ʈ ���´�
		List<OvertimeSignVO> osList = workService.getOvertimeSignList(overtimeNo);
		
		// 2. 1���� ���� ����Ʈ �����Ѵ�
		osList = (List<OvertimeSignVO>) workService.processList(osList);
		model.addAttribute("osList", osList);
		
		// 3. 1���� ���� ����Ʈ�� ���� ��Ȳ ī��Ʈ, �����Ȳ  ���Ѵ�
		Map<String, Object> map = workService.getCountNowstate(osList, ovo.getState());
		
		model.addAttribute("count", map.get("count"));
		model.addAttribute("nowState", map.get("nowState"));
		
		return "/work/overtime_view";
	}
	
	@RequestMapping(value = "/withdrawal.do", method = RequestMethod.POST)
	public void withdrawal(HttpServletResponse response, int overtimeNo) throws IOException {
		
		OvertimeVO vo = workService.selectOvertime(overtimeNo);
		
		if(vo.getState().equals("0")) {
			workService.withdrawal(overtimeNo);
			workService.overtimesignDelete(overtimeNo);
			response.getWriter().append("<script>alert('�ʰ��ٹ� ��û�� öȸ�Ǿ����ϴ�.');location.href='main.do';</script>");
		}else {
			response.getWriter().append("<script>alert('���� �������� �ʰ��ٹ� ��û�� öȸ�� �� �����ϴ�.');location.href='main.do';</script>");
		}
		response.getWriter().flush();
	}
	
	
	
	@RequestMapping(value = "/reloadList.do")
	@ResponseBody
	public Object reloadList(String obj, SearchVO searchVO, String pNum, Authentication authentication) {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		
		Map<String, Object> listMap = new HashMap<>();
		listMap.put("userid", login.getUserid());
		listMap.put("startDate", searchVO.getStartDate());
		if(searchVO.getEndDate()==null || searchVO.getEndDate().equals("")) {
			searchVO.setEndDate(calcCalendar.getTodayDate());
		}
		listMap.put("endDate", searchVO.getEndDate());
		
		List<?> list = new ArrayList<>();
		if(obj.equals("1")) {
			list = workService.selectAllMyWork(listMap);
			
		}else if(obj.equals("2")) {
			list = workService.selectAllMyOvertime(listMap);
			
		}else if(obj.equals("3")) {
			listMap.put("deptArr", workService.getDeptArr(login.getDept()));
			listMap.put("category_dept", searchVO.getCategory_dept());
			listMap.put("category_position", searchVO.getCategory_position());
			listMap.put("searchVal", searchVO.getSearchVal());
			
			int cnt = workService.getCountOfAllWorkList(listMap);
			PagingVO pagingVO = new PagingVO(Integer.parseInt(pNum), cnt, 10);
			listMap.put("pagingVO", pagingVO);
			
			list = workService.selectAllWork(listMap);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("pagingVO", pagingVO);
			return map;
		}
		
		return list;
	}

	
	/////////////////////////// ������ ///////////////////////////
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/main_admin.do", method = RequestMethod.GET)
	public String main_admin(Model model, Authentication authentication) {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		
		Map<String, Object> allWorkListMap = new HashMap<>();
		String[] deptArr = workService.getDeptArr(login.getDept());
		allWorkListMap.put("deptArr", deptArr);
		allWorkListMap.put("startDate", null);
		allWorkListMap.put("endDate", calcCalendar.getTodayDate());
		
		int cnt = workService.getCountOfAllWorkList(allWorkListMap);
		PagingVO pagingVO = new PagingVO(1, cnt, 10);
		allWorkListMap.put("pagingVO",pagingVO);
		
		List<WorkVO> allWorkList = workService.selectAllWork(allWorkListMap);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("allWorkList", allWorkList);
		
		return "/work/main_admin";
	}
	
	@Secured("ROLE_ADMIN")
	@ResponseBody
	@RequestMapping(value = "/workInsert_admin.do", method = RequestMethod.POST)
	public int workInsert(String wNo, String end) {
		Map<String, String> map = Map.of(
                "wNo", wNo,
                "end", end
        );
		return workService.updateWork_admin(map);
	}
	
	
}
