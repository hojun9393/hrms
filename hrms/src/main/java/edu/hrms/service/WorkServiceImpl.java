package edu.hrms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hrms.dao.WorkDAO;
import edu.hrms.vo.OvertimeSignVO;
import edu.hrms.vo.OvertimeVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.WorkVO;

@Service
public class WorkServiceImpl implements WorkService {

	@Autowired
	WorkDAO workDAO;
	
	@Override
	public WorkVO select(Map<String, String> map) {
		return workDAO.select(map);
	}
	
	@Override
	public String selectThisWeek(Map<String, String> map) {
		return workDAO.selectThisWeek(map);
	}
	
	@Override
	public int insert(Map<String, String> map) {
		return workDAO.insert(map);
	}
	
	@Override
	public int update(Map<String, String> map) {
		return workDAO.update(map);
	}
	
	@Override
	public int insertOvertime(Map<String, String> map) {
		return workDAO.insertOvertime(map);
	}
	
	@Override
	public List<SignLineVO> getSignLineList(Map<String, Object> map) {
		return workDAO.getSignLineList(map);
	}
	
	@Override
	public int getMaxNoByUserId(String userid) {
		return workDAO.getMaxNoByUserId(userid);
	}
	
	@Override
	public int insertOvertimeSign(List<OvertimeSignVO> list) {
		return workDAO.insertOvertimeSign(list);
	}
	
	@Override
	public List<WorkVO> selectAllWork(Map<String, String> map) {
		return workDAO.selectAllWork(map);
	}
	
	@Override
	public List<OvertimeVO> selectAllOvertime(String userid) {
		return workDAO.selectAllOvertime(userid);
	}
}
