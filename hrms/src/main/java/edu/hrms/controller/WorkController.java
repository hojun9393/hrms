package edu.hrms.controller;

import java.io.IOException;
import java.time.LocalDate;
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
		String workTime = workService.selectThisWeek(workTimeMap);
		model.addAttribute("workTime", workTime);
		
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
		
		int result = workService.insertOvertime(map);
		
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
		for(int i=0; i<positionArr.length; i++) {
			System.out.println(positionArr[i]);
		}
		
		List<SignLineVO> list = workService.getSignLineList(signLineMap);
		
		
		
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		
		if(result>0) {
			response.getWriter().append("<script>alert('초과근무 신청이 완료되었습니다.');location.href='main.do';</script>");
		}else {
			response.getWriter().append("<script>alert('오류가 발생하였습니다.');location.href='main.do';</script>");
		}
		response.getWriter().flush();
	}
	
	
	
	
	
	
	
	
}
