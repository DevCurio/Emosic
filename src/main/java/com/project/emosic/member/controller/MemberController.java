package com.project.emosic.member.controller;

import java.beans.PropertyEditor;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.project.emosic.member.model.service.MemberService;
import com.project.emosic.member.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
@SessionAttributes(value = {"loginMember", "anotherValue"}) //로그인 정보를 담는용도
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@PostMapping("/register")
	public String registerMember(User user, RedirectAttributes redirectAttr) {
	
		log.info("user = {}", user);
		
		try {
			
			//비밀번호 암호화
			String rawPassword = user.getPassword();
			String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
			log.info("rawPassword = {}", rawPassword);
			log.info("encodedPassword = {}", encodedPassword);
			
			//DB처리
			user.setPassword(encodedPassword);
			int result = memberService.insertUser(user);
			
			//결과 및 리다이렉트
			log.info("회원정보 db입력 성공");
			log.info("id = {}, pw = {}", user.getId(), user.getPassword());
			String msg = result > 0 ? "회원 등록 성공!" : "회원 등록 실패!";
			
			redirectAttr.addFlashAttribute("msg", msg);
			
			
		} catch(Exception e) {
			log.error(e.getMessage(), e);
			
			throw e;			
		}
		
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public ModelAndView login(
			@RequestParam String id,
			@RequestParam String password,
			ModelAndView mav,			//데이터와 이동페이지를 동시저장 용도
			HttpServletRequest request	//값을 받아오는 용도
	) {
		
		try {
			//해당 id 조회
			User user = memberService.selectOneUser(id);
		
			//로그인 여부 처리
			//로그인 성공			
			if(bcryptPasswordEncoder.matches(password, user.getPassword())) {
				mav.addObject("loginMember", user);
			}
			//로그인 실패
			else {
				//FlashMap 휘발성으로 spring에서 자동으로 값을 지워줌
				FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
				flashMap.put("msg", "아이디 혹은 비밀번호가 일치하지 않습니다.");
			}
		} catch (Exception e) {
			//1. logging
			log.error(e.getMessage(), e);
			//2. spring container에게 예외를 다시 던져서 error페이지로 이동시킨다.
			throw e;
		}
				
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		if(!sessionStatus.isComplete())
			sessionStatus.setComplete();
		
		return "redirect:/";
	}
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		//Member.enrollDate:java.sql.Date 타입 처리
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//커스텀에디터 생성 : allowEmpty - true (빈문자열을 null로 변환처리 허용)
		PropertyEditor editor = new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(java.sql.Date.class, editor);
	}
	
	@ResponseBody
	@GetMapping("/id/duplicate")
	public int idDuplicateCheck(String id) {	
		
		int isDuplicate = memberService.selectIdDuplicate(id);
		
		return isDuplicate;
	}
	
	@ResponseBody
	@GetMapping("/nickName/duplicate")
	public int nickNameDuplicateCheck(String nickName) {	
		
		int nickNameDuplicate = memberService.selectNickNameDuplicate(nickName);
		
		return nickNameDuplicate;
	}
	
	@GetMapping("/myPage")
	public String memberMypage(String id, Model model) {
		
		User user = memberService.selectOneUser(id);
		
		model.addAttribute("user",user);
		
		return "/member/myPage";
	}
	
}
