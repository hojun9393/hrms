package edu.hrms.service;

import edu.hrms.vo.NoticeVO;

public interface NoticeService {
NoticeVO select();
	
	int insert();

	int update();
}
