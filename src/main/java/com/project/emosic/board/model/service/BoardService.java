package com.project.emosic.board.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.project.emosic.board.model.vo.Board;

public interface BoardService {

	int insertBoard(Board board);

	List<Board> selectBoardList(Map<String, Object> param);

	int getTotalContents();

	Board selectOneBoardCollection(int no);

	void updateViewCnt(int no, HttpSession session);


}
