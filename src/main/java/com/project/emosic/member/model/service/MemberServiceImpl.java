package com.project.emosic.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.emosic.member.model.dao.MemberDao;
import com.project.emosic.member.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int insertUser(User user) {
		return memberDao.insertUser(user);
	}

	@Override
	public int selectIdDuplicate(String id) {
		return memberDao.selectIdDuplicate(id);
	}

	@Override
	public int selectNickNameDuplicate(String nickName) {
		return memberDao.selectNickNameDuplicate(nickName);
	}

	@Override
	public User selectOneUser(String id) {
		return memberDao.selectUser(id);
	}

	@Override
	public int updatePassword(Map<String, Object> param) {
		return memberDao.updatePassword(param);
	}

	@Override
	public int updateUser(User updateUser) {
		return memberDao.updateUser(updateUser);
	}

}