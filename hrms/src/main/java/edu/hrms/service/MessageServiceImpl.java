package edu.hrms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hrms.dao.MessageDAO;
import edu.hrms.vo.MsgReceiveVO;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	MessageDAO messageDAO;
	
	@Override
	public List<MsgReceiveVO> selectReceiverAll() {
		return messageDAO.selectReceiverAll();
	}

	@Override
	public List<Map<String, String>> selectDeptCount() {
		return messageDAO.selectDeptCount();
	}

}
