package edu.hrms.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserVO extends User {
	
	private String userid;
	private String name;
	private String password;
	private String authority;

	public UserVO(String username, String password, boolean enabled, boolean accountNonExpired,
					boolean credentialsNonExpired, boolean accountNonLocked,
					Collection<? extends GrantedAuthority> authorities, String authority, String name) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
		// security 외 필요한 유저 정보를 추가한다.
		this.userid = username;
		this.name = name;
		this.password = password;
		this.authority = authority;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	
	
}
