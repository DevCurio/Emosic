package com.project.emosic.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.emosic.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertBoard(Board board) {
		return session.insert("board.insertBoard", board);
	}
	
}
