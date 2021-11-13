package com.project.emosic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
}
