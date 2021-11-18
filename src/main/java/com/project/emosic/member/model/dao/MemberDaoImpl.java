package com.project.emosic.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.emosic.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;

	@Override
	public int insertMember(Member member) {
		return session.insert("member.insertMember", member);
	}

	@Override
	public int selectIdDuplicate(String id) {
		
		return session.selectOne("member.selectIdDuplicate", id);
	}

	@Override
	public int selectNickNameDuplicate(String nickName) {
		return session.selectOne("member.selectNickNameDuplicate", nickName);
	}
}