package com.project.emosic.security.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.project.emosic.member.model.vo.User;
import com.project.emosic.security.dao.SecurityDao;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Slf4j
public class SecurityService implements UserDetailsService {

	private SecurityDao securityDao;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		
		User user = securityDao.selectOneUser(userName);
		
		if(user == null ) {
			throw new UsernameNotFoundException("UserNotFoundException");
		}
		
		return user;
	}

}
