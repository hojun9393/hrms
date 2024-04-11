package edu.hrms.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import edu.hrms.vo.NoticeFileVO;
import edu.hrms.vo.NoticeVO;

public interface NoticeService {
	//selectAllNotice
	List<NoticeVO> selectNotice(Map<String,Object>map);
	//
	int getNoticeCount();
	//selectNoticeOne
	NoticeVO selectNoticeByNoticeNo(int noticeNo);
	//selectNoticeFileList
	List <NoticeFileVO> selectNoticeFileByNoticeNo(int noticeNo);
	//update
	int updateNotice(NoticeVO noticeVO);
	//insert
	int insertNotice(NoticeVO noticeVO);
	
	int getMaxNoByUserId(int userId);
	
	String getPath(HttpServletRequest request);
	
	List<NoticeFileVO> createFiles(List<MultipartFile> files, String path, int noticeNo);
	
	int insertNoticeFile(List<NoticeFileVO> vo);
	
		
	
	//delete
	int delyn(int noticeNo);
	
	
}
