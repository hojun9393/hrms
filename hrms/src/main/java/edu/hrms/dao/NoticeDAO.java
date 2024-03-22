package edu.hrms.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hrms.vo.NoticeVO;


@Repository
public class NoticeDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String namespace = "edu.hrms.mapper.noticeMapper";
	
	public NoticeVO select(){
		return sqlSession.selectOne(namespace+".select");
	}
	
	public int insert() {
		return sqlSession.insert(namespace+".insert");
	}
	
	public int update() {
		return sqlSession.update(namespace+".update");
	}
}
