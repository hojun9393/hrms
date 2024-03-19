package edu.hrms.service;

import java.util.List;

import edu.hrms.vo.DocVO;
import edu.hrms.vo.OverVO;
import edu.hrms.vo.VacaVO;

public interface SignService {

	List<DocVO> selectAllDoc();
	List<VacaVO> selectAllVaca();
	List<OverVO> selectAllOver();
}
