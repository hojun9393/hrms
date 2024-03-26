package edu.hrms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hrms.dao.VacaDAO;
import edu.hrms.vo.UserVO;
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
	public UserVO myRemainVaca(String userid) {
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
