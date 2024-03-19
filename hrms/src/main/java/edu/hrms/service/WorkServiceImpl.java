package edu.hrms.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hrms.dao.WorkDAO;

@Service
public class WorkServiceImpl implements WorkService {

	@Autowired
	WorkDAO workDAO;
	
	@Override
	public int insert(Map<String, String> map) {
		return workDAO.insert(map);
	}

	
	
}
