package com.project.emosic.member.model.dao;

import java.util.Map;

import com.project.emosic.member.model.vo.User;

public interface MemberDao {

	int insertUser(User user);
	
	int selectIdDuplicate(String id);

	int selectNickNameDuplicate(String nickName);

	User selectUser(String id);

	int updatePassword(Map<String, Object> param);

	int updateUser(User updateUser);

}
