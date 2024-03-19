package edu.hrms.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hrms.vo.WorkVO;

@Repository
public class WorkDAO {

	@Autowired
	SqlSession sqlSession;
	
	private final String namespace = "edu.hrms.mappers.workMapper";
	
	public WorkVO select(Map<String, String> map) {
		return sqlSession.selectOne(namespace+".select", map);
	}
	
	public int insert(Map<String, String> map) {
		return sqlSession.insert(namespace+".insert", map);
	}
	
	public int update(Map<String, String> map) {
		return sqlSession.update(namespace+".update", map);
	}
	
}
