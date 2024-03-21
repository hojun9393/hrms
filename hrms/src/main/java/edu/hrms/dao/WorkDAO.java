package edu.hrms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hrms.vo.OvertimeSignVO;
import edu.hrms.vo.OvertimeVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.WorkVO;

@Repository
public class WorkDAO {

	@Autowired
	SqlSession sqlSession;
	
	private final String namespace = "edu.hrms.mappers.workMapper";
	
	public WorkVO select(Map<String, String> map) {
		return sqlSession.selectOne(namespace+".select", map);
	}
	
	public String selectThisWeek(Map<String, String> map) {
		return sqlSession.selectOne(namespace+".selectThisWeek", map);
	}
	
	public int insert(Map<String, String> map) {
		return sqlSession.insert(namespace+".insert", map);
	}
	
	public int update(Map<String, String> map) {
		return sqlSession.update(namespace+".update", map);
	}
	
	public int insertOvertime(Map<String, String> map) {
		return sqlSession.insert(namespace+".insertOvertime", map);
	}
	
	public List<SignLineVO> getSignLineList(Map<String, Object> map) {
		return sqlSession.selectList(namespace+".getSignLineList", map);
	}
	
	public int getMaxNoByUserId(String userid) {
		return sqlSession.selectOne(namespace+".getMaxNoByUserId", userid);
	}
	
	public int insertOvertimeSign(List<OvertimeSignVO> list) {
		return sqlSession.insert(namespace+".insertOvertimeSign", list);
	}
	
	
	public List<WorkVO> selectAllWork(Map<String, String> map){
		return sqlSession.selectList(namespace+".selectAllWork", map);
	}
	
	public List<OvertimeVO> selectAllOvertime(String userid){
		return sqlSession.selectList(namespace+".selectAllOvertime", userid);
	}
	
}
