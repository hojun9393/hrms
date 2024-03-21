package edu.hrms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hrms.vo.DocVO;
import edu.hrms.vo.OverVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.VacaVO;

@Repository
public class SignDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String namespace = "edu.hrms.mapper.signMapper";
	
	public List<DocVO> selectAllDoc(int userId){
		return sqlSession.selectList(namespace+".selectAllDoc", userId);
	}
	
	public List<VacaVO> selectAllVaca(int userId){
		return sqlSession.selectList(namespace+".selectAllVaca", userId);
	}
	
	public List<OverVO> selectAllOver(int userId){
		return sqlSession.selectList(namespace+".selectAllOver", userId);
	}
	
	public List<SignLineVO> selectSignLineFromDocNo(int docNo){
		return sqlSession.selectList(namespace+".selectSignLineFromDocNo", docNo);
	}
	
	public List<SignLineVO> selectSignLineFromVacaNo(int vacaNo){
		return sqlSession.selectList(namespace+".selectSignLineFromVacaNo", vacaNo);
	}
	
	public List<SignLineVO> selectSignLineFromOverTimeNo(int overTimeNo){
		return sqlSession.selectList(namespace+".selectSignLineFromOverTimeNo", overTimeNo);
	}
	
	public DocVO selectDocFromDocNo(Map<String,Integer> map) {
		return sqlSession.selectOne(namespace+".selectDocFromDocNo", map);
	}
	
	public VacaVO selectVacaFromVacaNo(Map<String,Integer> map) {
		return sqlSession.selectOne(namespace+".selectVacaFromVacaNo", map);
	}
	
	public OverVO selectOverFromOverTimeNo(Map<String,Integer> map) {
		return sqlSession.selectOne(namespace+".selectOverFromOverTimeNo", map);
	}
	
	public int updateApprovedDoc(DocVO docVO) {
		return sqlSession.update(namespace+".updateApprovedDoc", docVO);
	}
	
	public int updateRejectedDoc(DocVO docVO) {
		return sqlSession.update(namespace+".updateRejectedDoc", docVO);
	}
	
	public int updateApprovedVaca(VacaVO vacaVO) {
		return sqlSession.update(namespace+".updateApprovedVaca", vacaVO);
	}
	
	public int updateRejectedVaca(VacaVO vacaVO) {
		return sqlSession.update(namespace+".updateRejectedVaca", vacaVO);
	}
	
	public int updateApprovedOver(OverVO overVO) {
		return sqlSession.update(namespace+".updateApprovedOver", overVO);
	}
	
	public int updateRejectedOver(OverVO overVO) {
		return sqlSession.update(namespace+".updateRejectedOver", overVO);
	}
}
