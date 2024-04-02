package edu.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hrms.dao.NoticeDAO;
import edu.hrms.vo.NoticeVO;


@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeDAO noticeDAO;
	// 공지사항 목록 조회 메서드

	@Override
	public List<NoticeVO> selectNotice() {
		return noticeDAO.selectNotice();
	}
	@Override
	public NoticeVO selectNoticeOne(int noticeNo) {
		return noticeDAO.selectNoticeOne(noticeNo);
	}
	
	
	
	/* @Override public int insert() { return noticeDAO.insert(); } */
	  
	  @Override
	  public int updateNotice(NoticeVO noticeVO) {
		  return noticeDAO.updateNotice(noticeVO); }
	 

}