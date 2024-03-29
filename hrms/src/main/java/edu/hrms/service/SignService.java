package edu.hrms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.hrms.vo.DocVO;
import edu.hrms.vo.OverVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.VacaVO;

public interface SignService {

	List<DocVO> selectAllDoc(int userId);
	List<VacaVO> selectAllVaca(int userId);
	List<OverVO> selectAllOver(int userId);
	
	List<SignLineVO> selectSignLineFromDocNo(int docNo);
	List<SignLineVO> selectSignLineFromVacaNo(int vacaNo);
	List<SignLineVO> selectSignLineFromOverTimeNo(int overTimeNo);
	
	DocVO selectDocFromDocNo(Map<String,Integer> map);
	VacaVO selectVacaFromVacaNo(Map<String,Integer> map);
	OverVO selectOverFromOverTimeNo(Map<String,Integer> map);
	
	int updateApprovedDoc(DocVO docVO);	
	int updateRejectedDoc(DocVO docVO);
	
	int updateApprovedVaca(VacaVO vacaVO);	
	int updateRejectedVaca(VacaVO vacaVO);
	
	int updateApprovedOver(OverVO overVO);	
	int updateRejectedOver(OverVO overVO);
	
	int updateDocState(int docNo);
	int updateVacaState(int vacaNo);
	int updateOverState(int overTimeNo);
	
	List<DocVO> selectDocSearch(HashMap<String, String> map);
	List<VacaVO> selectVacaSearch(HashMap<String, String> map);
	List<OverVO> selectOverSearch(HashMap<String, String> map);
}
