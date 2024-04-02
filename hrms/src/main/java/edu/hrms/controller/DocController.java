package edu.hrms.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.hrms.service.DocService;
import edu.hrms.service.WorkService;
import edu.hrms.vo.DocFileVO;
import edu.hrms.vo.DocSignVO;
import edu.hrms.vo.DocVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.UserVO;

@Controller
@RequestMapping(value = "/docu")
public class DocController {
	
	@Autowired
	WorkService workService;
	
	@Autowired
	DocService docService;
	
	@RequestMapping(value = "/main.do")
	public String main(Model model, Authentication authentication) {
		UserVO login = (UserVO) authentication.getPrincipal();
		String userid = login.getUserid();
		
//		List<DocVO> list_my = docService.selectList_myDoc(userid);
//		model.addAttribute("list_my", list_my);
		
		
		
		return "document/main";
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String write(Model model, Authentication authentication) {
		UserVO login = (UserVO) authentication.getPrincipal();
		
		List<SignLineVO> signLineList = workService.getSignLineList(login.getUserid(), login.getPosition(), "D");
		
		model.addAttribute("signLineList", signLineList);
		
		return "document/write";
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	@ResponseBody
	public String write(Authentication authentication, HttpServletRequest request, String title, String content, @RequestParam(value = "files", required = false) List<MultipartFile> files) throws IllegalStateException, IOException {
		
		UserVO login = (UserVO) authentication.getPrincipal();
		int userId = Integer.parseInt(login.getUserid());
		String path = docService.getPath(request);
//		String path = request.getSession().getServletContext().getRealPath("/resources/upload"); // 개발
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs(); // 존재하지 않는 모든 상위 폴더 생성
		}
		
		// 기안 작성 로직 순서
		// 1. doc 테이블에 insert 한다
		DocVO vo = new DocVO(userId, title, content);
		docService.insert(vo);
		
		// 2. insert된 docNo 얻어온다
		int docNo = docService.getMaxNoByUserId(userId);
		
		if(files.size()!=0) {
			// 3. 파일 생성한다.
			List<DocFileVO> fileList = docService.createFiles(files, path, docNo);
			
			// 4. docfile 테이블에 insert 한다
			docService.insertDocFile(fileList);
		}
		
		// 5. 결재라인 리스트 생성한다.
		List<SignLineVO> signLineList = workService.getSignLineList(Integer.toString(userId), login.getPosition(), "D");
		
		// 6. docSign 리스트 생성한다.
		List<DocSignVO> docSignList = docService.getDocSignList(signLineList, docNo);
		
		// 7. docsign 테이블에 insert 한다.
		int result = docService.insertDocSign(docSignList);
		
		return Integer.toString(result);
		
	}
	
	
	
	
}
