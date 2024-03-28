package edu.hrms.service;

import java.util.List;
import java.util.Map;

import edu.hrms.vo.OvertimeSignVO;
import edu.hrms.vo.OvertimeVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.WorkVO;

public interface WorkService {

	WorkVO selectMyWork(Map<String, String> map);
	
	String selectMyThisWeekTotalWorkTime(Map<String, String> map);
	
	String selectMyThisWeekTotalOvertimeTime(Map<String, String> map);
	
	String myThisWeekTotalWorkTimePlusMyTotalOvertimeTime(Map<String, String> map);
	
	int insert(Map<String, String> map);

	int update(Map<String, String> map);
	
	int updateOvertime(Map<String, String> map);
	
	int insertOvertime(Map<String, String> map);
	
	List<SignLineVO> getSignLineList(String userid, String position);
	
	int getMaxNoByUserId(String userid);
	
	int insertOvertimeSign(List<OvertimeSignVO> list);
	
	int withdrawal(int overtimeNo);
	
	int overtimesignDelete(int overtimeNo);
	
	OvertimeVO overtimeApplicationTodayAfternoon(Map<String, String> map);

	OvertimeVO overtimeApplicationTodayEvening(Map<String, String> map);
	
	List<WorkVO> selectAllMyWork(Map<String, Object> map);
	
	List<OvertimeVO> selectAllMyOvertime(Map<String, Object> map);
	
	OvertimeVO selectOvertime(int overtimeNo);
	
	List<OvertimeSignVO> getOvertimeSignList(List<SignLineVO> signLineList, int overtimeNo);
	
	List<OvertimeSignVO> getOvertimeSignList(int overtimeNo);
	
	String[] getDeptArr(String dept);
	
	List<WorkVO> selectAllWork(Map<String, Object> map);
	
	int getCountOfAllWorkList(Map<String, Object> map);
	
	
	
}
