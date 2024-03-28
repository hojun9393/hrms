package edu.hrms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hrms.dao.VacaDAO;
import edu.hrms.vo.OvertimeSignVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.VacaSignVO;
import edu.hrms.vo.VacaVO;

@Service
public class VacaServiceImpl implements VacaService {
	
	@Autowired
	VacaDAO vacaDAO;
	
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
	public int updateVacaStateToUse(String today) {
		return vacaDAO.updateVacaStateToUse(today);
	}
}
