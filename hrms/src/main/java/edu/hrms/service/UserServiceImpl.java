package edu.hrms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hrms.dao.UserDAO;
import edu.hrms.vo.EmployeeVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	@Override
	public Map<String, Object> selectLogin(String username) {
		return userDAO.selectLogin(username);
	}

	@Override
	public List<EmployeeVO> selectUserAll() {
		return userDAO.selectUserAll();
	}

	@Override
	public int updateUser(EmployeeVO employee) {
		return userDAO.updateUser(employee);
	}
	
}
