package edu.hrms.service;

import java.util.Map;

import edu.hrms.vo.WorkVO;

public interface WorkService {

	WorkVO selectStart(Map<String, String> map);
	
	int insert(Map<String, String> map);

	int update(Map<String, String> map);
	
}
