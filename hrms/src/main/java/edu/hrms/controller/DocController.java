package edu.hrms.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
import edu.hrms.vo.SearchVO;
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
		
		Map<String, String> map = new HashMap<>();
		map.put("userid", login.getUserid());
		map.put("dept", login.getDept());
		List<DocVO> list_my = docService.selectList(map);
		
		map.remove("userid");
		map.put("state", "state");
		List<DocVO> list_dept = docService.selectList(map);
		model.addAttribute("list_my", list_my);
		model.addAttribute("list_dept", list_dept);
		
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
		
		if(files.size()>0) {
			// 3. 파일 생성 및 파일vo리스트 리턴한다.
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
	
	@RequestMapping(value = "/reloadList.do")
	@ResponseBody
	public List<DocVO> reloadList(SearchVO searchVO, Authentication authentication){
		
		UserVO login = (UserVO)authentication.getPrincipal();
		if(searchVO.getStartDate()==null || searchVO.getStartDate().equals("")){
			searchVO.setStartDate(null);
		}
		if(searchVO.getEndDate()==null || searchVO.getEndDate().equals("")){
			searchVO.setEndDate(null);
		}
		Map<String, String> map = new HashMap<>();
		map.put("dept", login.getDept());
		map.put("startDate", searchVO.getStartDate());
		map.put("endDate", searchVO.getEndDate());
		
		if(searchVO.getListType().equals("my")) {
			map.put("userid", login.getUserid());
		}else {
			map.put("state", "state");
			map.put("position", searchVO.getPosition());
			map.put("searchVal", searchVO.getSearchVal());
		}
		System.out.println(searchVO.toString());
		List<DocVO> list = docService.selectList(map);

		return list;
	}
	
	@RequestMapping(value = "/view.do", method = RequestMethod.POST)
	public String view(Model model, int docNo) {
		
		DocVO vo = docService.selectDocByDocNo(docNo);
		model.addAttribute("vo", vo);
		
		// 1. db에서 sign 리스트 얻어온다
		List<DocSignVO> list = docService.getDocSignList(docNo);
		
		// 2. 1에서 얻은 리스트 가공한다
		list = (List<DocSignVO>) workService.processList(list);
		model.addAttribute("list", list);
		
		// 3. 1에서 얻은 리스트로 결재 현황 카운트, 진행상황  구한다
		Map<String, Object> map = workService.getCountNowstate(list, vo.getState());
		
		model.addAttribute("count", map.get("count"));
		model.addAttribute("nowState", map.get("nowState"));
		
		List<DocFileVO> dfList = docService.selectDocFileByDocNo(docNo);
		model.addAttribute("dfList", dfList);
		
		return "document/view";
	}
	
	@RequestMapping(value = "/withdrawal.do", method = RequestMethod.POST)
	public void withdrawal(HttpServletResponse response, int docNo) throws IOException {
		int result = docService.withdrawl(docNo);
		if(result>0) {
			response.getWriter().append("<script>alert('기안이 철회되었습니다.');location.href='../docu/main.do';</script>");
		}else {
			response.getWriter().append("<script>alert('오류가 발생했습니다.');location.href='../docu/main.do';</script>");
		}
		response.getWriter().flush();
	}
	
	@RequestMapping(value = "/download.do", method = RequestMethod.POST)
	public void download(HttpServletResponse response, HttpServletRequest request, DocFileVO vo) throws IOException {
		
		File f = new File(docService.getPath(request), vo.getRealNm());
        // file 다운로드 설정
        response.setContentType("application/download");
        response.setContentLength((int)f.length());
        String fileName = URLEncoder.encode(vo.getOriginNm(), "UTF-8");
        fileName = fileName.replaceAll("\\+", "%20");
        response.setHeader("Content-disposition", "attachment; filename=\"" + fileName + "\"");
        // response 객체를 통해서 서버로부터 파일 다운로드
        OutputStream os = response.getOutputStream();
        // 파일 입력 객체 생성
        FileInputStream fis = new FileInputStream(f);
        FileCopyUtils.copy(fis, os);
        fis.close();
        os.close();
		
	}
	
	
}
