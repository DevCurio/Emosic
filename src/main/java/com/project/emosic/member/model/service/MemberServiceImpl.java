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
	public boolean selectIdDuplicate(String id) {
		
		return memberDao.selectIdDuplicate(id);
	}
	
}