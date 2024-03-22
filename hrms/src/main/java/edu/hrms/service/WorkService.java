package edu.hrms.service;

import java.util.List;
import java.util.Map;

import edu.hrms.vo.OvertimeSignVO;
import edu.hrms.vo.OvertimeVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.WorkVO;

public interface WorkService {

	WorkVO selectMyWork(Map<String, String> map);
	
	String selectThisWeek(Map<String, String> map);
	
	int insert(Map<String, String> map);

	int update(Map<String, String> map);
	
	int insertOvertime(Map<String, String> map);
	
	List<SignLineVO> getSignLineList(Map<String, Object> map);
	
	int getMaxNoByUserId(String userid);
	
	int insertOvertimeSign(List<OvertimeSignVO> list);
	
	int withdrawal(int overtimeNo);
	
	int overtimeDelete(int overtimeNo);
	
	int isOvertimeApplicationToday(Map<String, String> map);
	
	List<WorkVO> selectAllMyWork(Map<String, String> map);
	
	List<OvertimeVO> selectAllOvertime(Map<String, String> map);
	
	OvertimeVO selectOvertime(int overtimeNo);
	
	List<OvertimeSignVO> getOvertimeSignList(int overtimeNo);
	
	Map<String, Object> getSignLineMap(String userid, String position);
	
	
	
}
