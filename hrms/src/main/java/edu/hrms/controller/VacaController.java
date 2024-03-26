package edu.hrms.controller;

import java.io.IOException;
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

import edu.hrms.service.VacaService;
import edu.hrms.service.WorkService;
import edu.hrms.util.CalcCalendar;
import edu.hrms.vo.OvertimeSignVO;
import edu.hrms.vo.OvertimeVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.UserVO2;
import edu.hrms.vo.VacaSignVO;
import edu.hrms.vo.VacaVO;

@Controller
@RequestMapping(value = "/vaca")
public class VacaController {
	
	@Autowired
	VacaService vacaService;
	
	@Autowired
	WorkService workService;
	
	@Autowired
	CalcCalendar calcCalendar;
	
	@RequestMapping(value = "/main.do")
	public String main(Model model) {
		
		String userid = "10003";
		
		Map<String, String> myVacaListMap = new HashMap<>();
		myVacaListMap.put("userid", userid);
		List<VacaVO> myVacaList = vacaService.selectMyVacaList(myVacaListMap);
		
		model.addAttribute("myVacaList", myVacaList);
		model.addAttribute("myRecentVacaApplication", vacaService.myRecentVacaApplication(userid));
		
		UserVO2 user = vacaService.myRemainVaca(userid);
		model.addAttribute("user", user);
		return "/vacation/main";
		
	}
	
	@RequestMapping(value = "/application.do", method = RequestMethod.GET)
	public String application(Model model) {
		
		String userid = "10003";
		String position = "E";
		
		Map<String, Object> signLineMap = workService.getSignLineMap(userid, position);
		List<SignLineVO> signLineList = workService.getSignLineList(signLineMap);
		
		model.addAttribute("signLineList", signLineList);
		
		return "/vacation/application";
	}
	
	@RequestMapping(value = "/application.do", method = RequestMethod.POST)
	public void application(HttpServletResponse response, String startDate, String endDate, String startTime, String endTime, String reason) throws IOException {
		
		Map<String, String> map = new HashMap<>();
		String userid = "10003";
		map.put("userid", userid);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("reason", reason);
		
		vacaService.insertVaca(map);
		int vacaNo = vacaService.getMaxNoByUserId(userid);
		
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
		
		List<VacaSignVO> vacaSignList = new ArrayList<>();
		
		for(SignLineVO vo : signLineList) {
			VacaSignVO vsvo = new VacaSignVO();
			vsvo.setVacaNo(vacaNo);
			vsvo.setSignLineNo(vo.getSignLineNo());
			vacaSignList.add(vsvo);
		}
		
		vacaService.insertVacaSign(vacaSignList);
		
		response.getWriter().append("<script>alert('연차 신청이 완료되었습니다.');location.href='main.do';</script>");
		response.getWriter().flush();
	}
	
	@RequestMapping(value = "/view.do")
	public String view(Model model, @RequestParam("no")int vacaNo) {
		
		VacaVO vo = vacaService.selectVacaByVacaNo(vacaNo);
		model.addAttribute("vo", vo);
		List<VacaSignVO> list = vacaService.getVacaSignList(vacaNo);
		boolean returningFlag = false;
		for(VacaSignVO data : list) {
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
		model.addAttribute("list", list);
		
		int count = 0;
		String nowState = "대기";
		for(VacaSignVO data : list) {
			if(data.getState()==2) {
				count++;
				nowState = "진행";
			}else if(data.getState()==3) {
				nowState = "반려";
				break;
			}
		}
		if(vo.getState().equals("9")) {
			nowState = "철회";
		}
		model.addAttribute("count", count);
		model.addAttribute("nowState", nowState);
		
		return "/vacation/view";
	}
	
	@RequestMapping(value = "/withdrawal.do", method = RequestMethod.POST)
	public void withdrawal(HttpServletResponse response, int vacaNo) throws IOException {
		
		VacaVO vo = vacaService.selectVacaByVacaNo(vacaNo);
		
		if(vo.getState().equals("0")) {
			vacaService.withdrawal(vacaNo);
			vacaService.vacaSignDelete(vacaNo);
			response.getWriter().append("<script>alert('연차 신청이 철회되었습니다.');location.href='main.do';</script>");
		}else {
			response.getWriter().append("<script>alert('결재 진행중인 연차 신청은 철회할 수 없습니다.');location.href='main.do';</script>");
		}
		response.getWriter().flush();
	}
	
	
	@RequestMapping(value = "/reloadList.do")
	@ResponseBody
	public List<VacaVO> myVacaList(String startDate, String endDate){
		
		String userid = "10003";
		if(startDate==null || startDate.equals("")){
			startDate = null;
		}
		if(endDate==null || endDate.equals("")){
			endDate = null;
		}
		Map<String, String> myVacaListMap = new HashMap<>();
		myVacaListMap.put("userid", userid);
		myVacaListMap.put("startDate", startDate);
		myVacaListMap.put("endDate", endDate);
		
		List<VacaVO> list = vacaService.selectMyVacaList(myVacaListMap);
		return list;
	}
	
	
}
