package edu.hrms.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkDAO {

	@Autowired
	SqlSession sqlSession;
	
	private final String namespace = "edu.hrms.mappers.workMapper";
	
	public int insert(Map<String,String> map) {
		return sqlSession.insert(namespace+".insert", map);
	}
	
}
