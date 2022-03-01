package com.project.emosic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	//return "WEB-INF/views/ .jsp"
	@GetMapping("/")
	public String main(Model model) {
		
		return "/home";
	}
	
	@GetMapping("/login")
	public String login() {
		return "/login/login";
	}
	
	@GetMapping("/register")
	public String register() {
		return "/member/register";
	}
	
	@GetMapping("/myPage")
	public String myPage() {
		return "/member/myPage";
	}
	
	@GetMapping("/storyList")
	public String storyList() {
		return "/board/storyList";
	}
	
	@GetMapping("/storyReg")
	public String storyReg() {
		return "/board/storyReg";
	}
	
	@GetMapping("/storyDetail")
	public String storyDetail() {
		return "/board/storyDetail";
	}
}
