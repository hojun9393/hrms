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
	//�۾�����������
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String write() {	
		return "/notice/write";
	}
	//�������������̵�
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String modify(int noticeNo, Model model) {
		NoticeVO noticeVO = noticeService.selectNoticeByNoticeNo(noticeNo);
		model.addAttribute("vo", noticeVO);
		return "/notice/modify";
	}
	//������ ������Ʈ
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String modifyupdate(NoticeVO noticeVO, Model model) {
		noticeService.updateNotice(noticeVO);
		return "redirect:main.do";
	}
	//delyn ������Ʈ
	@RequestMapping(value = "/delyn.do", method = RequestMethod.POST)
	public void delyn(HttpServletResponse response, int noticeNo) throws IOException {
			
			int result = noticeService.delyn(noticeNo);
			if(result>0) {
				response.getWriter().append("<script>alert('���������� �����Ǿ����ϴ�.');location.href='main.do';</script>");
				response.getWriter().flush();
			}else {				
				response.getWriter().append("<script>alert('���������� �������� �ʾҽ��ϴ�.');location.href='main.do';</script>");
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
			dir.mkdirs(); // �������� �ʴ� ��� ���� ���� ����
		}		
		System.out.println(files.size());
		
		// ���� �ۼ� ���� ����
		// 1. ���� ���̺� insert �Ѵ�
		NoticeVO vo = new NoticeVO(userid, title, content);
		int noticeInsert = noticeService.insertNotice(vo);
		
		if(noticeInsert>0) {
		// 2. insert�� noticeNo ���´�
		int noticeNo = noticeService.getMaxNoByUserId(userid);
		
		if(files.size()>0) {
			// 3. ���� ���� �� ����vo����Ʈ �����Ѵ�.
			List<NoticeFileVO> fileList = noticeService.createFiles(files, path, noticeNo);
			
			// 4. noticefile ���̺� insert �Ѵ�
			noticeService.insertNoticeFile(fileList);	
			}
			
		}
		
		/*
		 * if(files != null && files.size()>0) { // 3. ���� ���� �� ����vo����Ʈ �����Ѵ�.
		 * List<NoticeFileVO> fileList = noticeService.createFiles(files, path,
		 * noticeNo);
		 * 
		 * // 4. �������� ���̺� insert �Ѵ� noticeService.insertNoticeFile(fileList); }
		 */
		return "redirect:main.do";
		
	}

}