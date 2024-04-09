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
	//���̺���ü ����Ʈ ��������
	public List<NoticeVO> selectNotice(){
		return sqlSession.selectList(namespace+".selectNotice");
	}
	//�����μ�Ʈ
	public int insertNotice(NoticeVO noticeVO) {
		return sqlSession.insert(namespace+".insertNotice", noticeVO);
	}
	//�ֱٰ�������Ʈ
	public int getMaxNoByUserId(int userId) {
		return sqlSession.selectOne(namespace+".getMaxNoByUserId", userId);
	}
	//�����μ�Ʈ
	public int insertNoticeFile(List<NoticeFileVO> list) {
		return sqlSession.insert(namespace + ".insertNoticeFile", list);
	}
	//���� �ϳ� ����
	public NoticeVO selectNoticeByNoticeNo(int noticeNo) {
		return sqlSession.selectOne(namespace+".selectNoticeByNoticeNo", noticeNo);
	}	
	public List<NoticeVO> selectNoticeFilesByNoticeNo(int noticeNo) {
		return sqlSession.selectList(namespace+".selectNotiecFilesByNoticeNo", noticeNo);
	}
	//����
	public int updateNotice(NoticeVO noticeVO) {
		return sqlSession.update(namespace+".updateNotice", noticeVO);
	}
	//delyn ������Ʈ
	public int delyn(int noticeNo) {
		return sqlSession.update(namespace+".delyn", noticeNo);
	}
}
