package com.project.emosic.member.model.service;

import com.project.emosic.member.model.vo.User;

public interface MemberService {

	int insertUser(User user);
	
	int selectIdDuplicate(String id);
	
	int selectNickNameDuplicate(String nickName);

	User selectOneUser(String id);
	
}
