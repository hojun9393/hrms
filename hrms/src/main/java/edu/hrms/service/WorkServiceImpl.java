package edu.hrms.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hrms.dao.WorkDAO;
import edu.hrms.vo.WorkVO;

@Service
public class WorkServiceImpl implements WorkService {

	@Autowired
	WorkDAO workDAO;
	
	@Override
	public WorkVO selectStart(Map<String, String> map) {
		return workDAO.select(map);
	}
	
	@Override
	public int insert(Map<String, String> map) {
		return workDAO.insert(map);
	}
	
	@Override
	public int update(Map<String, String> map) {
		return workDAO.update(map);
	}
	
	
}