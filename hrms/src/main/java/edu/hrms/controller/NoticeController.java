package edu.hrms.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.hrms.service.NoticeService;
import edu.hrms.vo.DocFileVO;
import edu.hrms.vo.DocVO;
import edu.hrms.vo.NoticeFileVO;
import edu.hrms.vo.NoticeVO;
import edu.hrms.vo.UserVO;


@Controller
@RequestMapping(value ="/notice")
public class NoticeController {		
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String notice(Model model) {
		List<NoticeVO> list = noticeService.selectNotice();
		model.addAttribute("list", list);
		return "/notice/main";
	}
	
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public String view(int noticeNo, Model model) {
		NoticeVO noticeVO = noticeService.selectNoticeByNoticeNo(noticeNo);
		model.addAttribute("vo", noticeVO);
		return "/notice/view";
	}
	//글쓰기페이지로
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String write() {	
		return "/notice/write";
	}
	//수정페이지로이동
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String modify(int noticeNo, Model model) {
		NoticeVO noticeVO = noticeService.selectNoticeByNoticeNo(noticeNo);
		model.addAttribute("vo", noticeVO);
		return "/notice/modify";
	}
	//수정글 업데이트
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String modifyupdate(NoticeVO noticeVO, Model model) {
		noticeService.updateNotice(noticeVO);
		return "redirect:main.do";
	}
	//delyn 업데이트
	@RequestMapping(value = "/delyn.do", method = RequestMethod.POST)
	public void delyn(HttpServletResponse response, int noticeNo) throws IOException {
			
			int result = noticeService.delyn(noticeNo);
			if(result>0) {
				response.getWriter().append("<script>alert('공지사항이 삭제되었습니다.');location.href='main.do';</script>");
				response.getWriter().flush();
			}else {				
				response.getWriter().append("<script>alert('공지사항이 삭제되지 않았습니다.');location.href='main.do';</script>");
				response.getWriter().flush();
			}
		}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	@ResponseBody
	public String write(Authentication authentication, HttpServletRequest request, String title,
			 String content, @RequestParam(value = "files", required = false) List<MultipartFile> files) throws IllegalStateException, IOException {
		
		UserVO login = (UserVO) authentication.getPrincipal();
		int userid = Integer.parseInt(login.getUserid());
		String path = noticeService.getPath(request);
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs(); // 존재하지 않는 모든 상위 폴더 생성
		}		
		System.out.println(files.size());
		
		// 공지 작성 로직 순서
		// 1. 공지 테이블에 insert 한다
		NoticeVO vo = new NoticeVO(userid, title, content);
		int noticeInsert = noticeService.insertNotice(vo);
		
		if(noticeInsert>0) {
		// 2. insert된 noticeNo 얻어온다
		int noticeNo = noticeService.getMaxNoByUserId(userid);
		
		if(files.size()>0) {
			// 3. 파일 생성 및 파일vo리스트 리턴한다.
			List<NoticeFileVO> fileList = noticeService.createFiles(files, path, noticeNo);
			
			// 4. noticefile 테이블에 insert 한다
			noticeService.insertNoticeFile(fileList);	
			}
			
		}
		
		/*
		 * if(files != null && files.size()>0) { // 3. 파일 생성 및 파일vo리스트 리턴한다.
		 * List<NoticeFileVO> fileList = noticeService.createFiles(files, path,
		 * noticeNo);
		 * 
		 * // 4. 공지파일 테이블에 insert 한다 noticeService.insertNoticeFile(fileList); }
		 */
		return "redirect:main.do";
		
	}

}