package edu.hrms.service;

import java.util.List;
import java.util.Map;

import edu.hrms.vo.UserVO;
import edu.hrms.vo.VacaSignVO;
import edu.hrms.vo.VacaVO;

public interface VacaService {
	
	List<VacaVO> selectMyVacaList(Map<String, String> map);
	
	VacaVO myRecentVacaApplication(String userid);
	
	UserVO myRemainVaca(String userid);
	
	int insertVaca(Map<String, String> map);
	
	int getMaxNoByUserId(String userid);
	
	int insertVacaSign(List<VacaSignVO> list);
	
	VacaVO selectVacaByVacaNo(int vacaNo);
	
	List<VacaSignVO> getVacaSignList(int vacaNo);
	
	int withdrawal(int vacaNo);
	
	int vacaSignDelete(int vacaNo);
}
