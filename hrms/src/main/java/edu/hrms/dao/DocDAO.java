package edu.hrms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hrms.vo.DocFileVO;
import edu.hrms.vo.DocSignVO;
import edu.hrms.vo.DocVO;
import edu.hrms.vo.OvertimeSignVO;

@Repository
public class DocDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String namespace = "edu.hrms.mappers.docMapper";
	
	public List<DocVO> selectList(Map<String, String> map){
		return sqlSession.selectList(namespace+".selectList", map);
	}
	
	public int insert(DocVO vo) {
		return sqlSession.insert(namespace+".insert", vo);
	}
	
	public int getMaxNoByUserId(int userId) {
		return sqlSession.selectOne(namespace+".getMaxNoByUserId", userId);
	}
	
	public int insertDocFile(List<DocFileVO> list) {
		return sqlSession.insert(namespace+".insertDocFile", list);
	}
	
	public int insertDocSign(List<DocSignVO> list) {
		return sqlSession.insert(namespace+".insertDocSign", list);
	}
	
	public DocVO selectDocByDocNo(int docNo) {
		return sqlSession.selectOne(namespace+".selectDocByDocNo", docNo);
	}
	
	public List<DocSignVO> getDocSignList(int docNo){
		return sqlSession.selectList(namespace+".getDocSignList", docNo);
	}
	
	public List<DocFileVO> selectDocFileByDocNo(int docNo){
		return sqlSession.selectList(namespace+".selectDocFileByDocNo", docNo);
	}
	
	
}
