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
//		System.out.println(user.toString());
		model.addAttribute("user", user);
		return "/vacation/main";
		
	}
	
	@RequestMapping(value = "/application.do", method = RequestMethod.GET)
	public String application(Model model, Authentication authentication) {
		
		UserVO login = (UserVO)authentication.getPrincipal();
		
		List<SignLineVO> signLineList = workService.getSignLineList(login.getUserid(), login.getPosition());
		
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
		
		int vacaNoTest = vacaService.insertVaca(map);
		System.out.println(vacaNoTest);
		int vacaNo = vacaService.getMaxNoByUserId(userid);
		System.out.println(vacaNo);
		List<SignLineVO> signLineList = vacaService.getSignLineList(userid, login.getPosition());
		List<VacaSignVO> vacaSignList = vacaService.getVacaSignList(signLineList, vacaNo);
		
		vacaService.insertVacaSign(vacaSignList);
		
		response.getWriter().append("<script>alert('���� ��û�� �Ϸ�Ǿ����ϴ�.');location.href='main.do';</script>");
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
		String nowState = "���";
		for(VacaSignVO vsvo : list) {
			if(vsvo.getState()==1) {
				count++;
				nowState = "����";
			}else if(vsvo.getState()==2) {
				count++;
				nowState = "����";
			}else if(vsvo.getState()==3) {
				nowState = "�ݷ�";
				break;
			}
		}
		if(vo.getState().equals("9")) {
			nowState = "öȸ";
		}else if(vo.getState().equals("2")) {
			nowState = "����";
		}
		model.addAttribute("count", count);
		model.addAttribute("nowState", nowState);
		
		return "/vacation/view";
	}
	
	@RequestMapping(value = "/withdrawal.do", method = RequestMethod.POST)
	public void withdrawal(HttpServletResponse response, int vacaNo) throws IOException {
		
		VacaVO vo = vacaService.selectVacaByVacaNo(vacaNo);
		
		vacaService.withdrawal(vacaNo);
		vacaService.vacaSignDelete(vacaNo);
		
		response.getWriter().append("<script>alert('���� ��û�� öȸ�Ǿ����ϴ�.');location.href='main.do';</script>");
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
	
	@RequestMapping(value = "/test.do")
	public void test() {
		// ���� ���Ϸ�� ���� ����
		// 1. ������Ʈ�� ���� ����Ʈ�� �̴´�.
		List<VacaVO> list = vacaService.selectVacaListToUpdate(calcCalendar.getTodayDate());
		
		// 2. 1�� ���� ����Ʈ�� ���� ����, ��� ������ ������Ʈ�Ѵ�.
		int updateTimeCnt = vacaService.minusUserVaca(list);
		
		// 3. 1�� ���� ���¸� ���Ϸ�� �����Ѵ�.
//		int updateStateCnt = vacaService.updateVacaStateToUse(list);
		
		System.out.println("user ���� ��: "+updateTimeCnt);
//		System.out.println("vacation ���� ��: "+updateStateCnt);
	}
	
	
}
