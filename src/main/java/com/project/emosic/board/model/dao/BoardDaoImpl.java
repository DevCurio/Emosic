package com.project.emosic.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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

	@Override
	public List<Board> selectBoardList(Map<String, Object> param) {
		
		RowBounds rowBounds = new RowBounds();
		
		return session.selectList("board.selectBoardList", param);
	}

	@Override
	public int getTotalContents() {
		return session.selectOne("board.getTotalContents");
	}
	
}