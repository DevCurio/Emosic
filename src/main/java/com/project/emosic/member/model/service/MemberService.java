package com.project.emosic.member.model.service;

import com.project.emosic.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	int selectIdDuplicate(String id);
	
	int selectNickNameDuplicate(String nickName);

	Member selectOneMember(String id);
	
	
}
