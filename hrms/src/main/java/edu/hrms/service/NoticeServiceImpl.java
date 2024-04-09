package edu.hrms.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.hrms.dao.NoticeDAO;
import edu.hrms.vo.NoticeFileVO;
import edu.hrms.vo.NoticeVO;


@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeDAO noticeDAO;
	// 공지사항 목록 조회 메서드
	
	@Override
	public List<NoticeVO> selectNotice() {
		return noticeDAO.selectNotice();
	}
	@Override
	public NoticeVO selectNoticeByNoticeNo(int noticeNo) {
		return noticeDAO.selectNoticeByNoticeNo(noticeNo);
	}

	  @Override 
	  public int insertNotice(NoticeVO noticeVO) {
		  return noticeDAO.insertNotice(noticeVO); 
	}
	  
	  @Override
	  public int updateNotice(NoticeVO noticeVO) {
		  return noticeDAO.updateNotice(noticeVO);
	}
	  
	/*
	 * @Override public int insertNoticeFile(NoticeFileVO noticeFileVO) { return
	 * noticeDAO.insertNoticeFile(noticeFileVO); }
	 */
	  @Override
	  public int delyn(int noticeNo) {
		  return noticeDAO.delyn(noticeNo);
	  }
	  @Override
		public List<NoticeFileVO> createFiles(List<MultipartFile> files, String path, int noticeNo) {

			List<NoticeFileVO> list = new ArrayList<>();
			
			for(MultipartFile data : files) {
				if(!data.getOriginalFilename().isEmpty()) {
					NoticeFileVO vo = new NoticeFileVO();
					String originNm = data.getOriginalFilename();
					
					String[] fileNmArr = originNm.split("\\.");
					String ext = fileNmArr[fileNmArr.length-1].toLowerCase();
					
					String realNm = null;
					
					int i = 1;
					while(true) {
						realNm = fileNmArr[0] + "_" + i + "." + ext;
						File file = new File(path, realNm);
						if(!file.exists()) {
							break;
						}
						i++;
					}
					try {
						data.transferTo(new File(path, realNm));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					vo.setOriginNm(originNm);
					vo.setRealNm(realNm);
					vo.setNoticeNo(noticeNo);
					list.add(vo);
				}
			}
			return list;
		}
  	 @Override
	 public int insertNoticeFile(List<NoticeFileVO> vo) {
		
  		 return noticeDAO.insertNoticeFile(vo);
	 }
	@Override
	public int getMaxNoByUserId(int userId) {
		return noticeDAO.getMaxNoByUserId(userId);
	}
	
	@Override
	public String getPath(HttpServletRequest request) {
		return request.getSession().getServletContext().getRealPath("/resources/upload"); // 운영
	}
	
}