package com.project.emosic.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.emosic.member.model.dao.MemberDao;
import com.project.emosic.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public int insertMember(Member member) {
		
		return memberDao.insertMember(member);
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
	public Member selectOneMember(String id) {
		return memberDao.selectOneMember(id);
	}
	
}