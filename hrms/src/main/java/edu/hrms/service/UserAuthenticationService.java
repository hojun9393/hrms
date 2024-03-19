package edu.hrms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import edu.hrms.vo.UserVO;

/*
 * 입력한 로그인 아이디와 일치하는 DB 유저 정보를 UserVo 객체로 반환
 */
public class UserAuthenticationService implements UserDetailsService {

	SqlSession sqlSession;
	
	public UserAuthenticationService() {}
	public UserAuthenticationService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	
		Map<String, Object> user = 
				sqlSession.selectOne("edu.hrms.mappers.userMapper.selectLogin", username);
		
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
								, user.get("name").toString());
		
		return vo;
	}
}
