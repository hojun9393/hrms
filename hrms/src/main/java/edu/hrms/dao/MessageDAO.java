package edu.hrms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hrms.vo.MsgReceiveVO;

@Repository
public class MessageDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String namespace = "edu.hrms.mapper.messageMapper";
	
	public List<MsgReceiveVO> selectReceiverAll(){
		return sqlSession.selectList(namespace+".selectReceiverAll");
	}
	
	public List<Map<String, String>> selectDeptCount(){
		return sqlSession.selectList(namespace+".selectDeptCount");
	}
}
