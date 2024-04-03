package edu.hrms.service;

import java.util.List;
import java.util.Map;

import edu.hrms.vo.OvertimeSignVO;
import edu.hrms.vo.OvertimeVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.SuperSignVO;
import edu.hrms.vo.WorkVO;

public interface WorkService {

	WorkVO selectMyWork(Map<String, String> map);
	
	public Map<String, String> getWorkTimeMap(String userid);
	
	String selectMyThisWeekTotalWorkTime(Map<String, String> map);
	
	String selectMyThisWeekTotalOvertimeTime(Map<String, String> map);
	
	String selectMyThisWeekTotalWorkTimePlusMyTotalOvertimeTime(String myThisWeekTotalWorkTime, String myThisWeekTotalOvertimeTime);
	
	int insert(Map<String, String> map);

	int update(Map<String, String> map);
	
	int updateOvertime(Map<String, String> map);
	
	int insertOvertime(Map<String, String> map);
	
	List<SignLineVO> getSignLineList(String userid, String position, String type);
	
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
	
	public List<? extends SuperSignVO> processList(List<? extends SuperSignVO> list);
	
	public Map<String, Object> getCountNowstate(List<? extends SuperSignVO> list);
}
