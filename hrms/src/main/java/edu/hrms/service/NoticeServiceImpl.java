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
	// �������� ��� ��ȸ �޼���

	@Override
	public List<NoticeVO> selectNotice() {
		return noticeDAO.selectNotice();
	}
	
	/*
	 * @Override public int insert() { return noticeDAO.insert(); }
	 * 
	 * @Override public int update() { return noticeDAO.update(); }
	 */

}