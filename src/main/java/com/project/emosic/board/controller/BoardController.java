package com.project.emosic.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.emosic.board.model.service.BoardService;
import com.project.emosic.board.model.vo.Board;
import com.project.emosic.common.pageUtils;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@PostMapping("/storyReg")
	public String storyReg(
						@ModelAttribute Board board,
						HttpServletRequest request,
						RedirectAttributes redirectAttr) {
		
		try {
			log.debug("board = {}", board);
			
			int result = boardService.insertBoard(board);
			
			String msg = result > 0 ? "게시물 등록 성공!" : "게시물 등록 실패!";
			redirectAttr.addFlashAttribute("msg", msg);
			
		}catch (Exception e) {
			log.error("게시물 등록 오류!", e);
			throw e;
		}
		
		return "redirect:/board/storyList";
	}
	
	@GetMapping("/storyList")
	public void storyList(
						@RequestParam(defaultValue = "1") int cPage,
						Model model,
						HttpServletRequest request) {
		
		//1. 설정값
		int numPerPage = 10;
		log.debug("cPage = {}", cPage);
		
		Map<String, Object> param = new HashMap<>();
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);
		
		List<Board> list = boardService.selectBoardList(param);
		log.debug("list = {}", list);
		
		//2.pagebar
		int totalContents = boardService.getTotalContents();
		String url = request.getRequestURI();
		log.debug("totalContents = {}", totalContents);
		log.debug("url = {}", url);
		String pageBar = pageUtils.getPageBar(totalContents, cPage, numPerPage, url); 
				
		
		//2. jsp처리 위임
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
	}
	
	@GetMapping("/storyDetail")
	public void storyView(
						@RequestParam int no,
						HttpSession session,
						Model model) {
		
		Board board = boardService.selectOneBoardCollection(no);
		log.debug("board = {}", board);
		
		boardService.updateViewCnt(no,session);
		log.debug("boardNo = {}", no);
		
		model.addAttribute("board", board);
		
	}
	
}
