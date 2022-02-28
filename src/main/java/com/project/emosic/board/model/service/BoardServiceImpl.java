package com.project.emosic.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.emosic.board.model.dao.BoardDao;
import com.project.emosic.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public int insertBoard(Board board) {
		int result = 0;
		
		result = boardDao.insertBoard(board);
		
		
		return result;
	}

	@Override
	public List<Board> selectBoardList(Map<String, Object> param) {
		return boardDao.selectBoardList(param);
	}

	@Override
	public int getTotalContents() {
		return boardDao.getTotalContents();
	}
	
}
