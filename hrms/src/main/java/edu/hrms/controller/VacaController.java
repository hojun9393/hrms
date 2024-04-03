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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.hrms.service.VacaService;
import edu.hrms.service.WorkService;
import edu.hrms.util.CalcCalendar;
import edu.hrms.vo.OvertimeSignVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.UserVO;
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
	public String main(Model model, Authentication authentication) {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		String userid = login.getUserid();
		
		Map<String, String> myVacaListMap = new HashMap<>();
		myVacaListMap.put("userid", userid);
		List<VacaVO> myVacaList = vacaService.selectMyVacaList(myVacaListMap);
		
		model.addAttribute("myVacaList", myVacaList);
		model.addAttribute("myRecentVacaApplication", vacaService.myRecentVacaApplication(userid));
		
		Map<String, Integer> user = vacaService.myRemainVaca(userid);
		model.addAttribute("user", user);
		return "/vacation/main";
		
	}
	
	@RequestMapping(value = "/application.do", method = RequestMethod.GET)
	public String application(Model model, Authentication authentication) {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		
		List<SignLineVO> signLineList = workService.getSignLineList(login.getUserid(), login.getPosition(), "V");
		
		model.addAttribute("signLineList", signLineList);
		
		return "/vacation/application";
	}
	
	@RequestMapping(value = "/application.do", method = RequestMethod.POST)
	public void application(HttpServletResponse response, String startDate, String endDate, String startTime, String endTime, String reason, Authentication authentication) throws IOException {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		String userid = login.getUserid();
		
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("reason", reason);
		
		// 해당 날짜 연차 신청 여부 확인
		int cnt = vacaService.checkVacaAppCnt(map);
		System.out.println("cnt: "+cnt);
		if(cnt>0) {
			response.getWriter().append("<script>alert('해당 날짜에 이미 신청한 결재 대기\\(혹은 진행\\)중인 연차 내역이 있습니다.');location.href='main.do';</script>");
		}else {
			vacaService.insertVaca(map);
			int vacaNo = vacaService.getMaxNoByUserId(userid);
			List<SignLineVO> signLineList = workService.getSignLineList(userid, login.getPosition(), "O");
			List<VacaSignVO> vacaSignList = vacaService.getVacaSignList(signLineList, vacaNo);
			
			vacaService.insertVacaSign(vacaSignList);
			response.getWriter().append("<script>alert('연차 신청이 완료되었습니다.');location.href='main.do';</script>");
		}
		response.getWriter().flush();
	}
	
	@RequestMapping(value = "/view.do")
	public String view(Model model, @RequestParam("no")int vacaNo) {
		
		VacaVO vo = vacaService.selectVacaByVacaNo(vacaNo);
		model.addAttribute("vo", vo);
		
		// 1. db에서 sign 리스트 얻어온다
		List<VacaSignVO> list = vacaService.getVacaSignList(vacaNo);
		
		// 2. 1에서 얻은 리스트 가공한다
		list = (List<VacaSignVO>) workService.processList(list);
		model.addAttribute("list", list);
		
		// 3. 1에서 얻은 리스트로 결재 현황 카운트, 진행상황  구한다
		Map<String, Object> map = workService.getCountNowstate(list);
				
		if(vo.getState().equals("9")) {
			map.put("nowState", "철회");
		}else if(vo.getState().equals("2")) {
			map.put("nowState", "승인");
		}
		model.addAttribute("count", map.get("count"));
		model.addAttribute("nowState", map.get("nowState"));
		
		return "/vacation/view";
	}
	
	@RequestMapping(value = "/withdrawal.do", method = RequestMethod.POST)
	public void withdrawal(HttpServletResponse response, int vacaNo) throws IOException {
		
		VacaVO vo = vacaService.selectVacaByVacaNo(vacaNo);
		
		vacaService.withdrawal(vacaNo);
		vacaService.vacaSignDelete(vacaNo);
		
		response.getWriter().append("<script>alert('연차 신청이 철회되었습니다.');location.href='main.do';</script>");
		response.getWriter().flush();
	}
	
	
	@RequestMapping(value = "/reloadList.do")
	@ResponseBody
	public List<VacaVO> myVacaList(String startDate, String endDate, Authentication authentication){
		
		UserVO login = (UserVO)authentication.getPrincipal();
		
		if(startDate==null || startDate.equals("")){
			startDate = null;
		}
		if(endDate==null || endDate.equals("")){
			endDate = null;
		}
		Map<String, String> myVacaListMap = new HashMap<>();
		myVacaListMap.put("userid", login.getUserid());
		myVacaListMap.put("startDate", startDate);
		myVacaListMap.put("endDate", endDate);
		
		List<VacaVO> list = vacaService.selectMyVacaList(myVacaListMap);
		return list;
	}
	
	
}
