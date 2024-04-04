package edu.hrms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.VacaSignVO;
import edu.hrms.vo.VacaVO;

@Repository
public class VacaDAO {

	@Autowired
	SqlSession sqlSession;
	
	private final String namespace = "edu.hrms.mappers.vacaMapper";
	
	public List<VacaVO> selectMyVacaList(Map<String, String> map){
		return sqlSession.selectList(namespace+".selectMyVacaList", map);
	}
	
	public VacaVO myRecentVacaApplication(String userid) {
		return sqlSession.selectOne(namespace+".myRecentVacaApplication", userid);
	}
	
	public Map<String, Integer> myRemainVaca(String userid) {
		return sqlSession.selectOne(namespace+".myRemainVaca", userid);
	}
	
	public int insertVaca(Map<String, String> map) {
		return sqlSession.insert(namespace+".insertVaca", map);
	}
	
	public int getMaxNoByUserId(String userid) {
		return sqlSession.selectOne(namespace+".getMaxNoByUserId", userid);
	}
	
	public int checkVacaAppCnt(Map<String, String> map) {
		return sqlSession.selectOne(namespace+".checkVacaAppCnt", map);
	}
	
	public int insertVacaSign(List<VacaSignVO> list) {
		return sqlSession.insert(namespace+".insertVacaSign", list);
	}
	
	public VacaVO selectVacaByVacaNo(int vacaNo) {
		return sqlSession.selectOne(namespace+".selectVacaByVacaNo", vacaNo);
	}
	
	public List<VacaSignVO> getVacaSignList(int vacaNo){
		return sqlSession.selectList(namespace+".getVacaSignList", vacaNo);
	}
	
	public int withdrawal(int vacaNo) {
		return sqlSession.update(namespace+".withdrawal", vacaNo);
	}
	
	public int vacaSignDelete(int vacaNo) {
		return sqlSession.delete(namespace+".vacaSignDelete", vacaNo);
	}
	
	public List<VacaVO> selectVacaListToUpdate(String today) {
		return sqlSession.selectList(namespace+".selectVacaListToUpdate", today);
	}
	
	public int minusUserVaca(List<Map<String, Integer>> list) {
		return sqlSession.update(namespace+".minusUserVaca", list);
	}
	
	public int updateVacaStateToUse(List<VacaVO> list) {
		return sqlSession.update(namespace+".updateVacaStateToUse", list);
	}
	
	
	public List<VacaVO> selectAllVacaList(int[] stateArr){
		return sqlSession.selectList(namespace+".selectAllVacaList", stateArr);
	}
	
	public List<Map<String, Object>> selectAllRemainVacaList(){
		return sqlSession.selectList(namespace+".selectAllRemainVacaList");
	}
	
}
