package edu.hrms.service;

import java.util.List;
import java.util.Map;

import edu.hrms.vo.EmployeeVO;

public interface UserService {

	public Map<String, Object> selectLogin(String username);

	public List<EmployeeVO> selectUserAll();
}
