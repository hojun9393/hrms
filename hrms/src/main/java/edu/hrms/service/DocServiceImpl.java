package edu.hrms.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.hrms.dao.DocDAO;
import edu.hrms.vo.DocFileVO;
import edu.hrms.vo.DocSignVO;
import edu.hrms.vo.DocVO;
import edu.hrms.vo.OvertimeSignVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.VacaSignVO;

@Service
public class DocServiceImpl implements DocService {

	@Autowired
	DocDAO docDAO;
	
	@Override
	public List<DocVO> selectList(Map<String, String> map) {
		return docDAO.selectList(map);
	}
	
	@Override
	public int insert(DocVO vo) {
		return docDAO.insert(vo);
	}
	
	@Override
	public int getMaxNoByUserId(int userId) {
		return docDAO.getMaxNoByUserId(userId);
	}
	
	@Override
	public String getPath(HttpServletRequest request) {
		return request.getSession().getServletContext().getRealPath("/resources/upload"); // 운영
	}
	
	@Override
	public List<DocFileVO> createFiles(List<MultipartFile> files, String path, int docNo) {

		List<DocFileVO> list = new ArrayList<>();
		
		for(MultipartFile data : files) {
			if(!data.getOriginalFilename().isEmpty()) {
				DocFileVO vo = new DocFileVO();
				String originNm = data.getOriginalFilename();
				
				String[] fileNMArr = originNm.split("\\.");
				String ext = fileNMArr[fileNMArr.length-1].toLowerCase();
				
				String realNm = null;
				
				int i = 1;
				while(true) {
					realNm = fileNMArr[0] + "_" + i + "." + ext;
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
				vo.setDocNo(docNo);
				list.add(vo);
			}
		}
		return list;
	}

	@Override
	public int insertDocFile(List<DocFileVO> list) {
		return docDAO.insertDocFile(list);
	}
	
	@Override
	// insert 할 때 사용할 signVO 리스트 생성 메소드
	public List<DocSignVO> getDocSignList(List<SignLineVO> signLineList, int docNo) {
		List<DocSignVO> docSignList = new ArrayList<>();
		for(SignLineVO vo : signLineList) {
			DocSignVO dsvo = new DocSignVO();
			dsvo.setDocNo(docNo);
			dsvo.setSignLineNo(vo.getSignLineNo());
			docSignList.add(dsvo);
		}
		return docSignList;
	}
	
	@Override
	public int insertDocSign(List<DocSignVO> list) {
		return docDAO.insertDocSign(list);
	}
	
	@Override
	public DocVO selectDocByDocNo(int docNo) {
		return docDAO.selectDocByDocNo(docNo);
	}
	
	@Override
	// db에서 signVO 리스트 가져올 때 사용하는 메소드
	public List<DocSignVO> getDocSignList(int docNo) {
		return docDAO.getDocSignList(docNo);
	}
	
	@Override
	public List<DocFileVO> selectDocFileByDocNo(int docNo) {
		return docDAO.selectDocFileByDocNo(docNo);
	}
	
	@Override
	public int withdrawl(int docNo) {
		return docDAO.withdrawl(docNo);
	}
	
	
}
