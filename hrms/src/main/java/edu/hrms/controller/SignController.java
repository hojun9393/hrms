package edu.hrms.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.hrms.service.SignService;
import edu.hrms.vo.DocVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.SignVO;

@Controller
@RequestMapping(value = "/sign")
public class SignController {

	@Autowired
	SignService signService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		List<DocVO> docVO = signService.selectAllDoc();
		for(int i=0; i<docVO.size(); i++) {
			List<SignLineVO> signLineVO = signService.selectSignLineFromDocNo(docVO.get(i).getDocNo());
			for(int j=0; j<signLineVO.size(); j++) {
				if(signLineVO.get(j).getUserId() == 10001) {
					docVO.get(i).setMySignOrder(signLineVO.get(j).getSignOrder());
				}
			}
		docVO.get(i).setSignLineVO(signLineVO);
		}
		
		List<DocVO> docVOList = new ArrayList<DocVO>();
		for(int i=0; i<docVO.size(); i++) {
			List<SignLineVO> signLineVO = docVO.get(i).getSignLineVO();
			if(docVO.get(i).getMySignOrder()==1) {
				docVOList.add(docVO.get(i));
			}else if(docVO.get(i).getMySignOrder()==2 && signLineVO.get(0).getState().equals("2")) {
				docVOList.add(docVO.get(i));
			}else if(docVO.get(i).getMySignOrder()==3 && signLineVO.get(0).getState().equals("2")
					&& signLineVO.get(1).getState().equals("2")) {
				docVOList.add(docVO.get(i));
			}
		}

		SignVO vo = new SignVO(
				docVOList,
				signService.selectAllVaca(),
				signService.selectAllOver()
		);
		model.addAttribute("list", vo);
		
		return "/sign/main";
	}
	
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public String view(int docNo, Model model) {
		DocVO docVO = signService.selectDocFromDocNo(docNo);
		List<SignLineVO> signLineVO = signService.selectSignLineFromDocNo(docVO.getDocNo());
		for(int j=0; j<signLineVO.size(); j++) {
			if(signLineVO.get(j).getUserId() == 10001) {
				docVO.setMySignOrder(signLineVO.get(j).getSignOrder());
			}
		}
		docVO.setSignLineVO(signLineVO);
		
		model.addAttribute("vo", docVO);
		
		return "/sign/view";
	}
	 
	
}

