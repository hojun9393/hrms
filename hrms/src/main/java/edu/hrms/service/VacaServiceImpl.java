package edu.hrms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hrms.dao.VacaDAO;
import edu.hrms.util.CalcCalendar;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.VacaSignVO;
import edu.hrms.vo.VacaVO;

@Service
public class VacaServiceImpl implements VacaService {
	
	@Autowired
	VacaDAO vacaDAO;
	
	@Autowired
	CalcCalendar calcCalendar;
	
	@Override
	public List<VacaVO> selectMyVacaList(Map<String, String> map) {
		return vacaDAO.selectMyVacaList(map);
	}
	@Override
	public VacaVO myRecentVacaApplication(String userid) {
		return vacaDAO.myRecentVacaApplication(userid);
	}
	@Override
	public Map<String, Integer> myRemainVaca(String userid) {
		return vacaDAO.myRemainVaca(userid);
	}
	@Override
	public int insertVaca(Map<String, String> map) {
		return vacaDAO.insertVaca(map);
	}
	@Override
	public int getMaxNoByUserId(String userid) {
		return vacaDAO.getMaxNoByUserId(userid);
	}
	@Override
	public List<SignLineVO> getSignLineList(String userid, String position) {
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
		return vacaDAO.getSignLineList(signLineMap);
	
	}
	
	@Override
	public int insertVacaSign(List<VacaSignVO> list) {
		return vacaDAO.insertVacaSign(list);
	}
	@Override
	public VacaVO selectVacaByVacaNo(int vacaNo) {
		return vacaDAO.selectVacaByVacaNo(vacaNo);
	}
	
	@Override
	public List<VacaSignVO> getVacaSignList(List<SignLineVO> signLineList, int vacaNo) {
		// insert 할 때 사용하는 메소드
		List<VacaSignVO> vacaSignList = new ArrayList<>();
		for(SignLineVO vo : signLineList) {
			VacaSignVO vsvo = new VacaSignVO();
			vsvo.setVacaNo(vacaNo);
			vsvo.setSignLineNo(vo.getSignLineNo());
			vacaSignList.add(vsvo);
		}
		return vacaSignList;
	}
	
	@Override
	public List<VacaSignVO> getVacaSignList(int vacaNo) {
		return vacaDAO.getVacaSignList(vacaNo);
	}
	@Override
	public int withdrawal(int vacaNo) {
		return vacaDAO.withdrawal(vacaNo);
	}
	@Override
	public int vacaSignDelete(int vacaNo) {
		return vacaDAO.vacaSignDelete(vacaNo);
	}
	
	@Override
	public List<VacaVO> selectVacaListToUpdate(String today) {
		return vacaDAO.selectVacaListToUpdate(today);
	}
	
	@Override
	public int minusUserVaca(List<VacaVO> volist) {
		
		List<Map<String, Integer>> list = new ArrayList<>();
		
		for(VacaVO vo : volist) {
			Map<String, Integer> map = new HashMap<>();
			map.put("userid", vo.getUserId());
			map.put("useVaca", calcCalendar.getTotalUseHour(vo));
			list.add(map);
		}
		
		return vacaDAO.minusUserVaca(list);
	}
	
	// 여기에 vacation state 사용완료로 변경 로직 작성
	
}
