package edu.hrms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hrms.dao.NoticeDAO;
import edu.hrms.vo.NoticeVO;


@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeDAO noticeDAO;
	
	@Override
	public NoticeVO select() {
		return noticeDAO.select();
	}
	
	@Override
	public int insert() {
		return noticeDAO.insert();
	}
	
	@Override
	public int update() {
		return noticeDAO.update();
	}
}
