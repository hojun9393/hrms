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

import edu.hrms.service.WorkService;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.UserVO;

@Controller
@RequestMapping(value = "/docu")
public class DocuController {
	
	@Autowired
	WorkService workService;
	
	@RequestMapping(value = "/main.do")
	public String main() {
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
	public void write(HttpServletRequest request, @RequestParam("content") String content, @RequestParam(value = "files", required = false) List<MultipartFile> files) throws IllegalStateException, IOException {
		System.out.println(content);
		System.out.println(files.size());
		
		String path = request.getSession().getServletContext().getRealPath("/resources/upload"); 
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs(); // 존재하지 않는 모든 상위 폴더 생성
		}
		
		for(MultipartFile data : files) {
			if(!data.getOriginalFilename().isEmpty()) {
				
				//String fileNM = new String(uploadFile.getOriginalFilename().getBytes("8859_1"), "UTF-8");
				String fileNM = data.getOriginalFilename();
				System.out.println(fileNM);
				
				String[] fileNMArr = fileNM.split("\\.");
				System.out.println("fileNMArr length:"+fileNMArr.length);
				String ext = fileNMArr[fileNMArr.length-1];
				
				String realFileNM = fileNMArr[0]+"001."+ext;
				
				data.transferTo(new File(path, realFileNM));
			}
		}
		
		
		
		
	}
	
	
	
	
}
