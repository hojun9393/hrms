package edu.hrms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hrms.vo.NoticeVO;


@Repository
public class NoticeDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String namespace = "edu.hrms.mapper.noticeMapper";
	
	public List<NoticeVO> selectNotice(){
		return sqlSession.selectList(namespace+".selectNotice");
	}
	
	public int insert(NoticeVO noticeVO) {
		return sqlSession.insert(namespace+".insert", noticeVO);
	}
	
	public int update(NoticeVO noticeVO) {
		return sqlSession.update(namespace+".update", noticeVO);
	}
	
	public NoticeVO selectNoticeOne(int noticeNo) {
		return sqlSession.selectOne(namespace+".selectNoticeOne", noticeNo);
	}
}
