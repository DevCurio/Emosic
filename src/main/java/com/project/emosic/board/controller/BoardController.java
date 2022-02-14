package com.project.emosic.board.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

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

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("/storyList")
	public void storyList(
						@RequestParam(defaultValue = "1") int cPage,
						Model model,
						HttpServletRequest request) {
	}
	
	@PostMapping("/storyReg")
	public String storyReg(
						@ModelAttribute Board board,
						HttpServletRequest request,
						RedirectAttributes redirectAttr) {
		
		try {
			log.debug("board = {}", board);
			
			int result = boardService.insertBoard(board);
			
			String msg = result > 0 ? "게시물 등록 성공!" : "게시물 등록 실패!";
			
		}catch (Exception e) {
			log.error("게시물 등록 오류!", e);
			throw e;
		}
		
		
		return "redirect:/storyList";
	}
}
