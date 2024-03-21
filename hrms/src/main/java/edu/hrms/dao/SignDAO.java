package edu.hrms.dao;

import java.util.List;

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
	
	public List<DocVO> selectAllDoc(){
		return sqlSession.selectList(namespace+".selectAllDoc");
	}
	
	public List<VacaVO> selectAllVaca(){
		return sqlSession.selectList(namespace+".selectAllVaca");
	}
	
	public List<OverVO> selectAllOver(){
		return sqlSession.selectList(namespace+".selectAllOver");
	}
	
	public List<SignLineVO> selectSignLineFromDocNo(int docNo){
		return sqlSession.selectList(namespace+".selectSignLineFromDocNo", docNo);
	}
	
	public DocVO selectDocFromDocNo(int docNo) {
		return sqlSession.selectOne(namespace+".selectDocFromDocNo", docNo);
	}
}
