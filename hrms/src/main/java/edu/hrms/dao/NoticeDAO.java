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
	//���̺���ü row ����Ʈ�� ��������
	public List<NoticeVO> selectNotice(){
		return sqlSession.selectList(namespace+".selectNotice");
	}
	//�ͽ�ťƮ�� ���� ����
	public int insertNotice(NoticeVO noticeVO) {
		return sqlSession.insert(namespace+".insertNotice", noticeVO);
	}
	
	public int updateNotice(NoticeVO noticeVO) {
		return sqlSession.update(namespace+".updateNotice", noticeVO);
	}
	//�ϳ��� ����
	public NoticeVO selectNoticeOne(int noticeNo) {
		return sqlSession.selectOne(namespace+".selectNoticeOne", noticeNo);
	}
}
