package com.project.emosic.member.model.dao;

import com.project.emosic.member.model.vo.User;

public interface MemberDao {

	int insertUser(User user);
	
	int selectIdDuplicate(String id);

	int selectNickNameDuplicate(String nickName);

	User selectUser(String id);

	User selectOneMember(String id);
}
