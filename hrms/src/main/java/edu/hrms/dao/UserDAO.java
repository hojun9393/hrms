package edu.hrms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hrms.vo.EmployeeVO;

@Repository
public class UserDAO {

	@Autowired
	SqlSession sqlSession;
	
	private final String namespace = "edu.hrms.mappers.userMapper";
	
	public Map<String, Object> selectLogin(String username){
		return sqlSession.selectOne(namespace+".selectLogin", username);
	}

	public List<EmployeeVO> selectUserAll() {
		return sqlSession.selectList(namespace+".selectUserAll");
	}
	
	
	
}
