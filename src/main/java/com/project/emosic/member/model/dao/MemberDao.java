package com.project.emosic.member.model.dao;

import com.project.emosic.member.model.vo.Member;

public interface MemberDao {

	int insertMember(Member member);

	int selectIdDuplicate(String id);

	
}
