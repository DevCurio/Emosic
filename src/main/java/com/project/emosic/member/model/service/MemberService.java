package com.project.emosic.member.model.service;

import java.util.Map;

import com.project.emosic.member.model.vo.User;

public interface MemberService{

	int insertUser(User user);
	
	int selectIdDuplicate(String id);
	
	int selectNickNameDuplicate(String nickName);

	User selectOneUser(String id);

	int updatePassword(Map<String, Object> param);

	int updateUser(User updateUser);
	
}
