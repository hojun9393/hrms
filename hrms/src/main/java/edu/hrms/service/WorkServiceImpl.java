package edu.hrms.service;

import java.util.ArrayList;
import java.util.HashMap;
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
	public WorkVO selectMyWork(Map<String, String> map) {
		return workDAO.selectMyWork(map);
	}
	
	@Override
	public String selectMyThisWeekTotalWorkTime(Map<String, String> map) {
		return workDAO.selectMyThisWeekTotalWorkTime(map);
	}
	
	@Override
	public String selectMyThisWeekTotalOvertimeTime(Map<String, String> map) {
		return workDAO.selectMyThisWeekTotalOvertimeTime(map);
	}
	
	@Override
	public String myThisWeekTotalWorkTimePlusMyTotalOvertimeTime(Map<String, String> map) {
		return workDAO.myThisWeekTotalWorkTimePlusMyTotalOvertimeTime(map);
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
	public int updateOvertime(Map<String, String> map) {
		return workDAO.updateOvertime(map);
	}
	
	@Override
	public int insertOvertime(Map<String, String> map) {
		return workDAO.insertOvertime(map);
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
	public List<WorkVO> selectAllMyWork(Map<String, Object> map) {
		return workDAO.selectAllMyWork(map);
	}
	
	@Override
	public List<OvertimeVO> selectAllMyOvertime(Map<String, Object> map) {
		return workDAO.selectAllMyOvertime(map);
	}
	
	@Override
	public OvertimeVO selectOvertime(int overtimeNo) {
		return workDAO.selectOvertime(overtimeNo);
	}
	
	@Override
	public List<SignLineVO> getSignLineList(String userid, String position, String type) {
		if(position.equals("E")) {
			position = "C,D,L";
		}else if(position.equals("L")) {
			position = "C,D";
		}else if(position.equals("D")) {
			position = "C";
		}
		String[] positionArr = position.split(",");
		Map<String, Object> signLineMap = new HashMap<>();
		signLineMap.put("userid", userid);
		signLineMap.put("positionArr", positionArr);
		signLineMap.put("type", type);
		return workDAO.getSignLineList(signLineMap);
	}
	
	@Override
	public List<OvertimeSignVO> getOvertimeSignList(List<SignLineVO> signLineList, int overtimeNo) {
		// insert 할 때 사용하는 메소드
		List<OvertimeSignVO> overtimeSignList = new ArrayList<>();
		for(SignLineVO vo : signLineList) {
			OvertimeSignVO ovo = new OvertimeSignVO();
			ovo.setOvertimeNo(overtimeNo);
			ovo.setSignLineNo(vo.getSignLineNo());
			overtimeSignList.add(ovo);
		}
		return overtimeSignList;
	}
	
	@Override
	public List<OvertimeSignVO> getOvertimeSignList(int overtimeNo) {
		// db에서 데이터 가져올 때 사용하는 메소드
		return workDAO.getOvertimeSignList(overtimeNo);
	}
	
	@Override
	public int withdrawal(int overtimeNo) {
		return workDAO.withdrawal(overtimeNo);
	}
	
	@Override
	public int overtimesignDelete(int overtimeNo) {
		return workDAO.overtimesignDelete(overtimeNo);
	}
	
	@Override
	public OvertimeVO overtimeApplicationTodayAfternoon(Map<String, String> map) {
		return workDAO.overtimeApplicationTodayAfternoon(map);
	}
	
	@Override
	public OvertimeVO overtimeApplicationTodayEvening(Map<String, String> map) {
		return workDAO.overtimeApplicationTodayEvening(map);
	}
	
	@Override
	public String[] getDeptArr(String dept) {
		String[] deptArr = null;
		if(dept.equals("M")) {
			deptArr = new String[] {"M","D","S","P","H"};
		}else {
			deptArr = new String[] {dept};
		}
		return deptArr;
	}
	
	@Override
	public List<WorkVO> selectAllWork(Map<String, Object> map) {
		return workDAO.selectAllWork(map);
	}
	
	@Override
	public int getCountOfAllWorkList(Map<String, Object> map) {
		return workDAO.getCountOfAllWorkList(map);
	}
	
	
}
