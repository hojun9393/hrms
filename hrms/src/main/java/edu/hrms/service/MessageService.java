package edu.hrms.service;

import java.util.List;
import java.util.Map;

import edu.hrms.vo.MsgReceiveVO;

public interface MessageService {
	List<MsgReceiveVO> selectReceiverAll();
	List<Map<String, String>> selectDeptCount();
	int insertMsg(Map<String,Object> map);
}
