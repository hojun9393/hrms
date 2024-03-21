package edu.hrms.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hrms.dao.SignDAO;
import edu.hrms.vo.DocVO;
import edu.hrms.vo.OverVO;
import edu.hrms.vo.SignLineVO;
import edu.hrms.vo.VacaVO;

@Service
public class SignServiceImpl implements SignService{
	
	@Autowired
	SignDAO signDAO;
	
	@Override
	public List<DocVO> selectAllDoc() {
		return signDAO.selectAllDoc();
	}
	
	@Override
	public List<VacaVO> selectAllVaca() {
		return signDAO.selectAllVaca();
	}
	
	@Override
	public List<OverVO> selectAllOver() {
		return signDAO.selectAllOver();
	}
	
	@Override
	public List<SignLineVO> selectSignLineFromDocNo(int docNo) {
		return signDAO.selectSignLineFromDocNo(docNo);
	}
	
	@Override
	public DocVO selectDocFromDocNo(int docNo) {
		return signDAO.selectDocFromDocNo(docNo);
	}
}
