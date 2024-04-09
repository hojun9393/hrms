package edu.hrms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.hrms.vo.NoticeVO;
import edu.hrms.vo.DocVO;
import edu.hrms.vo.NoticeFileVO;


@Repository
public class NoticeDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String namespace = "edu.hrms.mapper.noticeMapper";
	//테이블전체 리스트 가져오기
	public List<NoticeVO> selectNotice(){
		return sqlSession.selectList(namespace+".selectNotice");
	}
	//공지인서트
	public int insertNotice(NoticeVO noticeVO) {
		return sqlSession.insert(namespace+".insertNotice", noticeVO);
	}
	//최근공지셀렉트
	public int getMaxNoByUserId(int userId) {
		return sqlSession.selectOne(namespace+".getMaxNoByUserId", userId);
	}
	//파일인서트
	public int insertNoticeFile(List<NoticeFileVO> list) {
		return sqlSession.insert(namespace + ".insertNoticeFile", list);
	}
	//공지 하나 선택
	public NoticeVO selectNoticeByNoticeNo(int noticeNo) {
		return sqlSession.selectOne(namespace+".selectNoticeByNoticeNo", noticeNo);
	}	
	public List<NoticeVO> selectNoticeFilesByNoticeNo(int noticeNo) {
		return sqlSession.selectList(namespace+".selectNotiecFilesByNoticeNo", noticeNo);
	}
	//수정
	public int updateNotice(NoticeVO noticeVO) {
		return sqlSession.update(namespace+".updateNotice", noticeVO);
	}
	//delyn 업데이트
	public int delyn(int noticeNo) {
		return sqlSession.update(namespace+".delyn", noticeNo);
	}
}
