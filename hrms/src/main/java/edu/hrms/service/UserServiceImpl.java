package edu.hrms.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.cj.jdbc.SuspendableXAConnection;

import edu.hrms.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	@Override
	public Map<String, Object> selectLogin(String username) {
		return userDAO.selectLogin(username);
	}
	
}
