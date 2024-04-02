package edu.hrms.service;

import java.util.List;

import edu.hrms.vo.NoticeVO;

public interface NoticeService {
	//selectAllNotice
	List<NoticeVO> selectNotice();
	//selectNoticeOne
	NoticeVO selectNoticeOne(int noticeNo);
	
	int updateNotice(NoticeVO noticeVO);
	
}
