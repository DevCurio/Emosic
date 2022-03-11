package com.project.emosic.security.dao;

import org.apache.ibatis.session.SqlSession;

import com.project.emosic.member.model.vo.User;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SecurityDao {

	
	private SqlSession session;

	public User selectOneUser(String userName) {
		return session.selectOne("user.selectOneUser", userName);
	}
}
