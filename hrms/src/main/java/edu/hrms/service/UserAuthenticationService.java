package edu.hrms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import edu.hrms.vo.UserVO;

public class UserAuthenticationService implements UserDetailsService {

	SqlSession sqlSession;
	
	public UserAuthenticationService() {}
	
	public UserAuthenticationService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	
		Map<String, Object> user = sqlSession.selectOne("edu.hrms.mappers.userMapper.selectLogin", username);
		
		if(user == null) {
			throw new UsernameNotFoundException(username);
		}
		
		List<GrantedAuthority> authority = new ArrayList<>();
		authority.add(new SimpleGrantedAuthority(user.get("authority").toString()));
		
		UserVO vo = new UserVO(user.get("username").toString()
								, user.get("password").toString()
								, (Integer)Integer.valueOf(user.get("enabled").toString()) == 1
								, true
								, true
								, true
								, authority
								, user.get("authority").toString()
								, user.get("name").toString()
								, user.get("email").toString()
								, user.get("dept").toString()
								, user.get("position").toString()
								, user.get("joindate").toString()
								, user.get("retiredate").toString()
								, Integer.parseInt(user.get("state").toString())
								, user.get("phone").toString()
								, user.get("addr").toString()
								, Integer.parseInt(user.get("keepVaca").toString())
								, Integer.parseInt(user.get("useVaca").toString())
								, user.get("deptCase").toString()
								, user.get("positionCase").toString()
								);
		
		/*UserVO vo = new UserVO(user.get("username").toString()
				   ,user.get("password").toString()
				   ,(Integer)Integer.valueOf(user.get("enabled").toString()) == 1
				   ,true
				   ,true
				   ,true
				   ,authority
				   ,user.get("authority").toString()
				   ,user.get("name").toString());*/
		
		return vo;
	}
}
