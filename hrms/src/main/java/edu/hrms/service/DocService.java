package edu.hrms.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import edu.hrms.vo.DocFileVO;
import edu.hrms.vo.DocSignVO;
import edu.hrms.vo.DocVO;
import edu.hrms.vo.SignLineVO;

public interface DocService {

	List<DocVO> selectList_myDoc(String userid);
	
	int insert(DocVO vo);
	
	int getMaxNoByUserId(int userId);
	
	String getPath(HttpServletRequest request);
	
	List<DocFileVO> createFiles(List<MultipartFile> files, String path, int docNo);
	
	int insertDocFile(List<DocFileVO> list);
	
	List<DocSignVO> getDocSignList(List<SignLineVO> signLineList, int docNo);
	
	int insertDocSign(List<DocSignVO> list);
}
