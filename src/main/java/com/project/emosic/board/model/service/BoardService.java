package com.project.emosic.board.model.service;

import java.util.List;
import java.util.Map;

import com.project.emosic.board.model.vo.Board;

public interface BoardService {

	int insertBoard(Board board);

	List<Board> selectBoardList(Map<String, Object> param);

	int getTotalContents();

	Board selectOneBoardCollection(int no);

	int updateViewCnt(int no);


}
