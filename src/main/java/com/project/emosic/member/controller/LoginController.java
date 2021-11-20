package com.project.emosic.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.project.emosic.member.model.service.MemberService;
import com.project.emosic.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/login")
@SessionAttributes(value = {"loginMember", "anotherValue"}) //로그인 정보를 담는용도
public class LoginController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@PostMapping("/login")
	public ModelAndView login(
			@RequestParam String id,
			@RequestParam String password,
			ModelAndView mav,			//데이터와 이동페이지를 동시저장 용도
			HttpServletRequest request	//값을 받아오는 용도
	) {
		
		try {
			log.info("id = {}, password = {}", id, password);
			//해당 id 조회
			Member member = memberService.selectOneMember(id);
			
			log.info("member = {}", member);
			
			//로그인 여부 처리
			//로그인 성공
			if(member != null & bcryptPasswordEncoder.matches(password, member.getPassword())) {
				mav.addObject("loginMember", member);
			}
			//로그인 실패
			else {
				//FlashMap 휘발성으로 spring에서 자동으로 값을 지워줌
				FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
				flashMap.put("msg", "아이디 혹은 비밀번호가 일치하지 않습니다.");
			}
		} catch (Exception e) {

		}
				
		mav.setViewName("redirect:/");
		return mav;
	}
}
