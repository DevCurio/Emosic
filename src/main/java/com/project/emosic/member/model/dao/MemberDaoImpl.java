package com.project.emosic.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.emosic.member.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertUser(User user) {
		return session.insert("user.insertUser", user);
	}

	@Override
	public int selectIdDuplicate(String id) {
		return session.selectOne("user.selectIdDuplicate", id);
	}

	@Override
	public int selectNickNameDuplicate(String nickName) {
		return session.selectOne("user.selectNickNameDuplicate", nickName);
	}

	@Override
	public User selectUser(String id) {
		return session.selectOne("user.selectOneUser", id);
	}

	@Override
	public int updatePassword(Map<String, Object> param) {
		return session.update("user.updatePassword", param);
	}

	@Override
	public int updateUser(User updateUser) {
		return session.update("user.updateUser", updateUser);
	}



}