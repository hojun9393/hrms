package edu.hrms.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.hrms.service.SignService;
import edu.hrms.vo.DocVO;
import edu.hrms.vo.OverVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.SignVO;
import edu.hrms.vo.UserVO;
import edu.hrms.vo.VacaVO;

@Controller
@RequestMapping(value = "/sign")
public class SignController {
	
	private int userId = 0;
	
	@Autowired
	SignService signService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Authentication authentication, Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		UserVO loginUser = (UserVO)authentication.getPrincipal();
		userId = Integer.parseInt(loginUser.getUserid());
		
		List<DocVO> docVO = signService.selectAllDoc(userId);
		List<VacaVO> vacaVO = signService.selectAllVaca(userId);
		List<OverVO> overVO = signService.selectAllOver(userId);
		
		//doc
		for(int i=0; i<docVO.size(); i++) {
			List<SignLineVO> signLineVO = signService.selectSignLineFromDocNo(docVO.get(i).getDocNo());
			for(int j=0; j<signLineVO.size(); j++) {
				if(signLineVO.get(j).getUserId() == userId) {
					docVO.get(i).setMySignOrder(signLineVO.get(j).getSignOrder());
				}
			}
		docVO.get(i).setSignLineVO(signLineVO);
		}
		
		List<DocVO> docVOList = new ArrayList<DocVO>();
		int docSignCount = 0;
		int vacaSignCount = 0;
		int overSignCount = 0;
		for(int i=0; i<docVO.size(); i++) {
			List<SignLineVO> signLineVO = docVO.get(i).getSignLineVO();
			if(signLineVO.size()==3) {
				if(docVO.get(i).getMySignOrder() == 1) {
					docVOList.add(docVO.get(i));
					if(docVO.get(i).getMySignState().equals("0")) {
						docSignCount++;
					}
				}else if(docVO.get(i).getMySignOrder()==2 && signLineVO.get(0).getState().equals("2")) {
					docVOList.add(docVO.get(i));
					if(docVO.get(i).getMySignState().equals("0")) {
						docSignCount++;
					}
				}else if(docVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")
						&& signLineVO.get(1).getState().equals("2")) {
					docVOList.add(docVO.get(i));
					if(docVO.get(i).getMySignState().equals("0")) {
						docSignCount++;
					}
				}
			}else if(signLineVO.size()==2){
				if(docVO.get(i).getMySignOrder()==2) {
					docVOList.add(docVO.get(i));
					if(docVO.get(i).getMySignState().equals("0")) {
						docSignCount++;
					}
				}else if(docVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")){
					docVOList.add(docVO.get(i));
					if(docVO.get(i).getMySignState().equals("0")) {
						docSignCount++;
					}
				}
			}else if(signLineVO.size()==1) {
				if(docVO.get(i).getMySignOrder()==3) {
					docVOList.add(docVO.get(i));
					if(docVO.get(i).getMySignState().equals("0")) {
						docSignCount++;
					}
				}
			}
		}
		
		//vacation
		for(int i=0; i<vacaVO.size(); i++) {
			List<SignLineVO> signLineVO = signService.selectSignLineFromVacaNo(vacaVO.get(i).getVacaNo());
			for(int j=0; j<signLineVO.size(); j++) {
				if(signLineVO.get(j).getUserId() == userId) {
					vacaVO.get(i).setMySignOrder(signLineVO.get(j).getSignOrder());
				}
			}
		vacaVO.get(i).setSignLineVO(signLineVO);
		}
		
		List<VacaVO> vacaVOList = new ArrayList<VacaVO>();
		for(int i=0; i<vacaVO.size(); i++) {
			List<SignLineVO> signLineVO = vacaVO.get(i).getSignLineVO();
			if(signLineVO.size()==3) {
				if(vacaVO.get(i).getMySignOrder() == 1) {
					vacaVOList.add(vacaVO.get(i));
					if(vacaVO.get(i).getMySignState().equals("0")) {
						vacaSignCount++;
					}
				}else if(vacaVO.get(i).getMySignOrder()==2 && signLineVO.get(0).getState().equals("2")) {
					vacaVOList.add(vacaVO.get(i));
					if(vacaVO.get(i).getMySignState().equals("0")) {
						vacaSignCount++;
					}
				}else if(vacaVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")
						&& signLineVO.get(1).getState().equals("2")) {
					vacaVOList.add(vacaVO.get(i));
					if(vacaVO.get(i).getMySignState().equals("0")) {
						vacaSignCount++;
					}
				}
			}else if(signLineVO.size()==2){
				if(vacaVO.get(i).getMySignOrder()==2) {
					vacaVOList.add(vacaVO.get(i));
					if(vacaVO.get(i).getMySignState().equals("0")) {
						vacaSignCount++;
					}
				}else if(vacaVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")){
					vacaVOList.add(vacaVO.get(i));
					if(vacaVO.get(i).getMySignState().equals("0")) {
						vacaSignCount++;
					}
				}
			}else if(signLineVO.size()==1) {
				if(vacaVO.get(i).getMySignOrder()==3) {
					vacaVOList.add(vacaVO.get(i));
					if(vacaVO.get(i).getMySignState().equals("0")) {
						vacaSignCount++;
					}
				}
			}
		}
		
		//overtime
		for(int i=0; i<overVO.size(); i++) {
			List<SignLineVO> signLineVO = signService.selectSignLineFromOverTimeNo(overVO.get(i).getOverTimeNo());
			for(int j=0; j<signLineVO.size(); j++) {
				if(signLineVO.get(j).getUserId() == userId) {
					overVO.get(i).setMySignOrder(signLineVO.get(j).getSignOrder());
				}
			}
			overVO.get(i).setSignLineVO(signLineVO);
		}
		
		List<OverVO> overVOList = new ArrayList<OverVO>();
		for(int i=0; i<overVO.size(); i++) {
			List<SignLineVO> signLineVO = overVO.get(i).getSignLineVO();
			if(signLineVO.size()==3) {
				if(overVO.get(i).getMySignOrder() == 1) {
					overVOList.add(overVO.get(i));
					if(overVO.get(i).getMySignState().equals("0")) {
						overSignCount++;
					}
				}else if(overVO.get(i).getMySignOrder()==2 && signLineVO.get(0).getState().equals("2")) {
					overVOList.add(overVO.get(i));
					if(overVO.get(i).getMySignState().equals("0")) {
						overSignCount++;
					}
				}else if(overVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")
						&& signLineVO.get(1).getState().equals("2")) {
					overVOList.add(overVO.get(i));
					if(overVO.get(i).getMySignState().equals("0")) {
						overSignCount++;
					}
				}
			}else if(signLineVO.size()==2){
				if(overVO.get(i).getMySignOrder()==2) {
					overVOList.add(overVO.get(i));
					if(overVO.get(i).getMySignState().equals("0")) {
						overSignCount++;
					}
				}else if(overVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")){
					overVOList.add(overVO.get(i));
					if(overVO.get(i).getMySignState().equals("0")) {
						overSignCount++;
					}
				}
			}else if(signLineVO.size()==1) {
				if(overVO.get(i).getMySignOrder()==3) {
					overVOList.add(overVO.get(i));
					if(overVO.get(i).getMySignState().equals("0")) {
						overSignCount++;
					}
				}
			}
				
		}
		SignVO vo = new SignVO(
				docVOList,
				vacaVOList,
				overVOList
		);
		model.addAttribute("list", vo);
		model.addAttribute("docSignCount", docSignCount);
		model.addAttribute("vacaSignCount", vacaSignCount);
		model.addAttribute("overSignCount", overSignCount);
		
		return "/sign/main";
	}
	
	@RequestMapping(value = "/docView.do", method = RequestMethod.GET)
	public String docView(int docNo, Model model) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("docNo", docNo);
		map.put("userId", userId);
		DocVO docVO = signService.selectDocFromDocNo(map);
		List<SignLineVO> signLineVO = signService.selectSignLineFromDocNo(docVO.getDocNo());
		
		int count = signLineVO.size();
		for(int j=0; j<signLineVO.size(); j++) {
			if(signLineVO.get(j).getUserId() == userId) {
				docVO.setMySignOrder(signLineVO.get(j).getSignOrder());
			}
			if(signLineVO.get(j).getState().equals("0")) {
				count--;
			}
		}
		docVO.setStateCount(count);
		docVO.setSignLineVO(signLineVO);
		
		model.addAttribute("vo", docVO);
		
		return "/sign/docView";
	}
	
	@RequestMapping(value = "/vacaView.do", method = RequestMethod.GET)
	public String vacaView(int vacaNo, Model model) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("vacaNo", vacaNo);
		map.put("userId", userId);
		VacaVO vacaVO = signService.selectVacaFromVacaNo(map);
		List<SignLineVO> signLineVO = signService.selectSignLineFromVacaNo(vacaVO.getVacaNo());
		
		int count = signLineVO.size();
		for(int j=0; j<signLineVO.size(); j++) {
			if(signLineVO.get(j).getUserId() == userId) {
				vacaVO.setMySignOrder(signLineVO.get(j).getSignOrder());
			}
			if(signLineVO.get(j).getState().equals("0")) {
				count--;
			}
		}
		vacaVO.setStateCount(count);
		vacaVO.setSignLineVO(signLineVO);
		
		model.addAttribute("vo", vacaVO);
		
		return "/sign/vacaView";
	}
	
	@RequestMapping(value = "/overView.do", method = RequestMethod.GET)
	public String OverView(int overTimeNo, Model model) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("overTimeNo", overTimeNo);
		map.put("userId", userId);
		OverVO overVO = signService.selectOverFromOverTimeNo(map);
		List<SignLineVO> signLineVO = signService.selectSignLineFromOverTimeNo(overVO.getOverTimeNo());
		
		int count = signLineVO.size();
		for(int j=0; j<signLineVO.size(); j++) {
			if(signLineVO.get(j).getUserId() == userId) {
				overVO.setMySignOrder(signLineVO.get(j).getSignOrder());
			}
			if(signLineVO.get(j).getState().equals("0")) {
				count--;
			}
		}
		overVO.setStateCount(count);
		overVO.setSignLineVO(signLineVO);
		
		model.addAttribute("vo", overVO);
		
		return "/sign/overView";
	}
	
	@RequestMapping(value = "/approvedDoc.do", method = RequestMethod.POST)
	public void approvedDoc(DocVO docVO, HttpServletResponse res) throws IOException {
		int result = 0;
		List<SignLineVO> signLineVO = signService.selectSignLineFromDocNo(docVO.getDocNo());
		for(int i=0; i<signLineVO.size(); i++) {
			if(signLineVO.get(i).getSignLineNo()==Integer.parseInt(docVO.getMySignLineNo())) {
				if(signLineVO.get(i).getNextState() == null || signLineVO.get(i).getNextState().equals("0")) {
					result = signService.updateApprovedDoc(docVO);
					signService.updateDocState(docVO.getDocNo());
				}else {
					result = -1;
				}
			}
		}
		res.setContentType("text/html; charset=utf-8");
		res.setCharacterEncoding("UTF-8");
		if(result>0) {
			res.getWriter().append("<script>alert('승인완료 되었습니다.');location.href='main.do'</script>");
		}else if(result == -1) {
			res.getWriter().append("<script>alert('이미 상위 직급 사원이 결재처리 하여 수정이 불가합니다.');location.href='main.do'</script>");
		}else {
			res.getWriter().append("<script>alert('승인되지 않았습니다.');location.href='main.do'</script>");
		}
		res.getWriter().flush();
	}
	
	@RequestMapping(value = "/rejectedDoc.do", method = RequestMethod.POST)
	public void rejectedDoc(DocVO docVO, HttpServletResponse res) throws IOException {
		int result = 0;
		List<SignLineVO> signLineVO = signService.selectSignLineFromDocNo(docVO.getDocNo());
		for(int i=0; i<signLineVO.size(); i++) {
			if(signLineVO.get(i).getSignLineNo()==Integer.parseInt(docVO.getMySignLineNo())) {
				if(signLineVO.get(i).getNextState() == null || signLineVO.get(i).getNextState().equals("0")) {
					result = signService.updateRejectedDoc(docVO);
					signService.updateDocState(docVO.getDocNo());
				}else {
					result = -1;
				}
			}
		}
		
		res.setContentType("text/html; charset=utf-8");
		res.setCharacterEncoding("UTF-8");
		if(result>0) {
			res.getWriter().append("<script>alert('반려 되었습니다.');location.href='main.do'</script>");
		}else if(result == -1){
			res.getWriter().append("<script>alert('이미 상위 직급 사원이 결재처리 하여 수정이 불가합니다.');location.href='main.do'</script>");
		}else {
			res.getWriter().append("<script>alert('반려 되지 않았습니다.');location.href='main.do'</script>");
		}
		res.getWriter().flush();
	}
	
	@RequestMapping(value = "/approvedVaca.do", method = RequestMethod.POST)
	public void approvedVaca(VacaVO vacaVO, HttpServletResponse res) throws IOException {
		int result = 0;
		List<SignLineVO> signLineVO = signService.selectSignLineFromVacaNo(vacaVO.getVacaNo());
		for(int i=0; i<signLineVO.size(); i++) {
			if(signLineVO.get(i).getSignLineNo()==Integer.parseInt(vacaVO.getMySignLineNo())) {
				if(signLineVO.get(i).getNextState() == null || signLineVO.get(i).getNextState().equals("0")) {
					result = signService.updateApprovedVaca(vacaVO);
					signService.updateVacaState(vacaVO.getVacaNo());
				}else {
					result = -1;
				}
			}
		}
		res.setContentType("text/html; charset=utf-8");
		res.setCharacterEncoding("UTF-8");
		if(result>0) {
			res.getWriter().append("<script>alert('승인완료 되었습니다.');location.href='main.do'</script>");
		}else if(result == -1) {
			res.getWriter().append("<script>alert('이미 상위 직급 사원이 결재처리 하여 수정이 불가합니다.');location.href='main.do'</script>");
		}else {
			res.getWriter().append("<script>alert('승인되지 않았습니다.');location.href='main.do'</script>");
		}
		res.getWriter().flush();
	}
	
	@RequestMapping(value = "/rejectedVaca.do", method = RequestMethod.POST)
	public void rejectedVaca(VacaVO vacaVO, HttpServletResponse res) throws IOException {
		int result = 0;
		List<SignLineVO> signLineVO = signService.selectSignLineFromVacaNo(vacaVO.getVacaNo());
		for(int i=0; i<signLineVO.size(); i++) {
			if(signLineVO.get(i).getSignLineNo()==Integer.parseInt(vacaVO.getMySignLineNo())) {
				if(signLineVO.get(i).getNextState() == null || signLineVO.get(i).getNextState().equals("0")) {
					result = signService.updateRejectedVaca(vacaVO);
					signService.updateVacaState(vacaVO.getVacaNo());
				}else {
					result = -1;
				}
			}
		}
		res.setContentType("text/html; charset=utf-8");
		res.setCharacterEncoding("UTF-8");
		if(result>0) {
			res.getWriter().append("<script>alert('반려 되었습니다.');location.href='main.do'</script>");
		}else if(result == -1){
			res.getWriter().append("<script>alert('이미 상위 직급 사원이 결재처리 하여 수정이 불가합니다.');location.href='main.do'</script>");
		}else {
			res.getWriter().append("<script>alert('반려 되지 않았습니다.');location.href='main.do'</script>");
		}
		res.getWriter().flush();
	}
	
	@RequestMapping(value = "/approvedOver.do", method = RequestMethod.POST)
	public void approvedOver(OverVO overVO, HttpServletResponse res) throws IOException {
		int result = 0;
		List<SignLineVO> signLineVO = signService.selectSignLineFromOverTimeNo(overVO.getOverTimeNo());
		for(int i=0; i<signLineVO.size(); i++) {
			if(signLineVO.get(i).getSignLineNo()==Integer.parseInt(overVO.getMySignLineNo())) {
				if(signLineVO.get(i).getNextState() == null || signLineVO.get(i).getNextState().equals("0")) {
					result = signService.updateApprovedOver(overVO);
					signService.updateOverState(overVO.getOverTimeNo());
				}else {
					result = -1;
				}
			}
		} 
		res.setContentType("text/html; charset=utf-8");
		res.setCharacterEncoding("UTF-8");
		if(result>0) {
			res.getWriter().append("<script>alert('승인완료 되었습니다.');location.href='main.do'</script>");
		}else if(result == -1) {
			res.getWriter().append("<script>alert('이미 상위 직급 사원이 결재처리 하여 수정이 불가합니다.');location.href='main.do'</script>");
		}else {
			res.getWriter().append("<script>alert('승인되지 않았습니다.');location.href='main.do'</script>");
		}
		res.getWriter().flush();
	}
	
	@RequestMapping(value = "/rejectedOver.do", method = RequestMethod.POST)
	public void rejectedOver(OverVO overVO, HttpServletResponse res) throws IOException {
		int result = 0;
		List<SignLineVO> signLineVO = signService.selectSignLineFromOverTimeNo(overVO.getOverTimeNo());
		for(int i=0; i<signLineVO.size(); i++) {
			if(signLineVO.get(i).getSignLineNo()==Integer.parseInt(overVO.getMySignLineNo())) {
				if(signLineVO.get(i).getNextState() == null || signLineVO.get(i).getNextState().equals("0")) {
					result = signService.updateRejectedOver(overVO);
					signService.updateOverState(overVO.getOverTimeNo());
				}else {
					result = -1;
				}
			}
		}
		res.setContentType("text/html; charset=utf-8");
		res.setCharacterEncoding("UTF-8");
		if(result>0) {
			res.getWriter().append("<script>alert('반려 되었습니다.');location.href='main.do'</script>");
		}else if(result == -1) {
			res.getWriter().append("<script>alert('이미 상위 직급 사원이 결재처리 하여 수정이 불가합니다.');location.href='main.do'</script>");
		}else {
			res.getWriter().append("<script>alert('반려되지 않았습니다.');location.href='main.do'</script>");
		}
		res.getWriter().flush();
	}
	
	@RequestMapping(value="/search.do")
	@ResponseBody
	public HashMap<String, Object> search(String startDate, String endDate, String name, String mySignState){
		if(endDate.equals("")) {
			endDate = null;
		}
		if(startDate.equals("")) {
			startDate = null;
		}
		if(mySignState.equals("all")) {
			mySignState = null;
		}
		if(name.equals("")) {
			name = null;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", Integer.toString(userId));
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("name", name);
		map.put("mySignState", mySignState);
		
		System.out.println("startDate:"+startDate+"endDate:"+endDate+"name:"+name+"state:"+mySignState);
		List<DocVO> docVO = signService.selectDocSearch(map);
		List<VacaVO> vacaVO = signService.selectVacaSearch(map);
		List<OverVO> overVO = signService.selectOverSearch(map);
		
		//doc
		for(int i=0; i<docVO.size(); i++) {
			List<SignLineVO> signLineVO = signService.selectSignLineFromDocNo(docVO.get(i).getDocNo());
			for(int j=0; j<signLineVO.size(); j++) {
				if(signLineVO.get(j).getUserId() == userId) {
					docVO.get(i).setMySignOrder(signLineVO.get(j).getSignOrder());
				}
			}
		docVO.get(i).setSignLineVO(signLineVO);
		}
		
		List<DocVO> docVOList = new ArrayList<DocVO>();
		int docSignCount = 0;
		int vacaSignCount = 0;
		int overSignCount = 0;
		for(int i=0; i<docVO.size(); i++) {
			List<SignLineVO> signLineVO = docVO.get(i).getSignLineVO();
			if(signLineVO.size()==3) {
				if(docVO.get(i).getMySignOrder() == 1) {
					docVOList.add(docVO.get(i));
					if(docVO.get(i).getMySignState().equals("0")) {
						docSignCount++;
					}
				}else if(docVO.get(i).getMySignOrder()==2 && signLineVO.get(0).getState().equals("2")) {
					docVOList.add(docVO.get(i));
					if(docVO.get(i).getMySignState().equals("0")) {
						docSignCount++;
					}
				}else if(docVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")
						&& signLineVO.get(1).getState().equals("2")) {
					docVOList.add(docVO.get(i));
					if(docVO.get(i).getMySignState().equals("0")) {
						docSignCount++;
					}
				}
			}else if(signLineVO.size()==2){
				if(docVO.get(i).getMySignOrder()==2) {
					docVOList.add(docVO.get(i));
					if(docVO.get(i).getMySignState().equals("0")) {
						docSignCount++;
					}
				}else if(docVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")){
					docVOList.add(docVO.get(i));
					if(docVO.get(i).getMySignState().equals("0")) {
						docSignCount++;
					}
				}
			}else if(signLineVO.size()==1) {
				if(docVO.get(i).getMySignOrder()==3) {
					docVOList.add(docVO.get(i));
					if(docVO.get(i).getMySignState().equals("0")) {
						docSignCount++;
					}
				}
			}
		}
		
		//vacation
		for(int i=0; i<vacaVO.size(); i++) {
			List<SignLineVO> signLineVO = signService.selectSignLineFromVacaNo(vacaVO.get(i).getVacaNo());
			for(int j=0; j<signLineVO.size(); j++) {
				if(signLineVO.get(j).getUserId() == userId) {
					vacaVO.get(i).setMySignOrder(signLineVO.get(j).getSignOrder());
				}
			}
		vacaVO.get(i).setSignLineVO(signLineVO);
		}
		
		List<VacaVO> vacaVOList = new ArrayList<VacaVO>();
		for(int i=0; i<vacaVO.size(); i++) {
			List<SignLineVO> signLineVO = vacaVO.get(i).getSignLineVO();
			if(signLineVO.size()==3) {
				if(vacaVO.get(i).getMySignOrder() == 1) {
					vacaVOList.add(vacaVO.get(i));
					if(vacaVO.get(i).getMySignState().equals("0")) {
						vacaSignCount++;
					}
				}else if(vacaVO.get(i).getMySignOrder()==2 && signLineVO.get(0).getState().equals("2")) {
					vacaVOList.add(vacaVO.get(i));
					if(vacaVO.get(i).getMySignState().equals("0")) {
						vacaSignCount++;
					}
				}else if(vacaVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")
						&& signLineVO.get(1).getState().equals("2")) {
					vacaVOList.add(vacaVO.get(i));
					if(vacaVO.get(i).getMySignState().equals("0")) {
						vacaSignCount++;
					}
				}
			}else if(signLineVO.size()==2){
				if(vacaVO.get(i).getMySignOrder()==2) {
					vacaVOList.add(vacaVO.get(i));
					if(vacaVO.get(i).getMySignState().equals("0")) {
						vacaSignCount++;
					}
				}else if(overVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")){
					vacaVOList.add(vacaVO.get(i));
					if(vacaVO.get(i).getMySignState().equals("0")) {
						vacaSignCount++;
					}
				}
			}else if(signLineVO.size()==1) {
				if(vacaVO.get(i).getMySignOrder()==3) {
					vacaVOList.add(vacaVO.get(i));
					if(vacaVO.get(i).getMySignState().equals("0")) {
						vacaSignCount++;
					}
				}
			}
		}
		
		//overtime
		for(int i=0; i<overVO.size(); i++) {
			List<SignLineVO> signLineVO = signService.selectSignLineFromOverTimeNo(overVO.get(i).getOverTimeNo());
			for(int j=0; j<signLineVO.size(); j++) {
				if(signLineVO.get(j).getUserId() == userId) {
					overVO.get(i).setMySignOrder(signLineVO.get(j).getSignOrder());
				}
			}
			overVO.get(i).setSignLineVO(signLineVO);
		}
		
		List<OverVO> overVOList = new ArrayList<OverVO>();
		for(int i=0; i<overVO.size(); i++) {
			List<SignLineVO> signLineVO = overVO.get(i).getSignLineVO();
			if(signLineVO.size()==3) {
				if(overVO.get(i).getMySignOrder() == 1) {
					overVOList.add(overVO.get(i));
					if(overVO.get(i).getMySignState().equals("0")) {
						overSignCount++;
					}
				}else if(overVO.get(i).getMySignOrder()==2 && signLineVO.get(0).getState().equals("2")) {
					overVOList.add(overVO.get(i));
					if(overVO.get(i).getMySignState().equals("0")) {
						overSignCount++;
					}
				}else if(overVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")
						&& signLineVO.get(1).getState().equals("2")) {
					overVOList.add(overVO.get(i));
					if(overVO.get(i).getMySignState().equals("0")) {
						overSignCount++;
					}
				}
			}else if(signLineVO.size()==2){
				if(overVO.get(i).getMySignOrder()==2) {
					overVOList.add(overVO.get(i));
					if(overVO.get(i).getMySignState().equals("0")) {
						overSignCount++;
					}
				}else if(overVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")){
					overVOList.add(overVO.get(i));
					if(overVO.get(i).getMySignState().equals("0")) {
						overSignCount++;
					}
				}
			}else if(signLineVO.size()==1) {
				if(overVO.get(i).getMySignOrder()==3) {
					overVOList.add(overVO.get(i));
					if(overVO.get(i).getMySignState().equals("0")) {
						overSignCount++;
					}
				}
			}
				
		}
		SignVO vo = new SignVO(
				docVOList,
				vacaVOList,
				overVOList
		);
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("list", vo);
		resultMap.put("docSignCount", docSignCount);
		resultMap.put("vacaSignCount", vacaSignCount);
		resultMap.put("overSignCount", overSignCount);
		
		return resultMap;
	}
	
}

