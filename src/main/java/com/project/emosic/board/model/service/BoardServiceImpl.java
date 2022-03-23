package com.project.emosic.board.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

	@Override
	public Board selectOneBoardCollection(int no) {
		return boardDao.selectOneBoardCollection(no);
	}

	
	@Override
	public void updateViewCnt(int no, HttpSession session) {
		
		long update_time = 0; //null 방지용 초기값
		
		if(session.getAttribute("update_time_"+no)!= null) {
			update_time = (long) session.getAttribute("update_time_"+no);
		}
		
		long current_time = System.currentTimeMillis();
		if(current_time - update_time > 60 * 60 * 1000) {	//1시간 지나야 조회수 증가
			
			boardDao.updateViewCnt(no);
			session.setAttribute("update_time_" + no, current_time);
			
		}
		
	}
	
}
