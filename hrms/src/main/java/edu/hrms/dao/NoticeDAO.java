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
	//테이블전체 row 리스트로 가져오기
	public List<NoticeVO> selectNotice(){
		return sqlSession.selectList(namespace+".selectNotice");
	}
	//익스큐트된 쿼리 갯수
	public int insertNotice(NoticeVO noticeVO) {
		return sqlSession.insert(namespace+".insertNotice", noticeVO);
	}
	
	public int updateNotice(NoticeVO noticeVO) {
		return sqlSession.update(namespace+".updateNotice", noticeVO);
	}
	//하나만 선택
	public NoticeVO selectNoticeOne(int noticeNo) {
		return sqlSession.selectOne(namespace+".selectNoticeOne", noticeNo);
	}
}
