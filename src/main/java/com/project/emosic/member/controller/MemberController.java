package com.project.emosic.member.controller;

import java.beans.PropertyEditor;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.project.emosic.member.model.service.MemberService;
import com.project.emosic.member.model.service.MemberServiceImpl;
import com.project.emosic.member.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
@SessionAttributes(value = {"loginMember", "anotherValue"}) //????????? ????????? ????????????
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@PostMapping("/register")
	public String registerMember(User user, RedirectAttributes redirectAttr) {
	
		try {
			
			//???????????? ?????????
			String encodedPassword = bcryptPasswordEncoder.encode(user.getPassword());
			log.info("encodedPassword = {}", encodedPassword);
			
			//DB??????
			user.setPassword(encodedPassword);
			int result = memberService.insertUser(user);
			
			//?????? ??? ???????????????
			log.info("???????????? db?????? ??????");
			log.info("id = {}, pw = {}", user.getId(), user.getPassword());
			String msg = result > 0 ? "?????? ?????? ??????!" : "?????? ?????? ??????!";
			
			redirectAttr.addFlashAttribute("msg", msg);
			
			
		} catch(NullPointerException e) {
			log.error(e.getMessage(), e);
			
			throw e;			
		}
		
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public ModelAndView login(
			@RequestParam String id,
			@RequestParam String password,
			ModelAndView mav,			//???????????? ?????????????????? ???????????? ??????
			HttpServletRequest request	//?????? ???????????? ??????
	) {
		
		try {
			//?????? id ??????
			User user = memberService.selectOneUser(id);
		
			//????????? ?????? ??????
			//????????? ??????			
			if(user != null && bcryptPasswordEncoder.matches(password, user.getPassword())) {
				mav.addObject("loginMember", user);
			}
			//????????? ??????
			else {
				//FlashMap ??????????????? spring?????? ???????????? ?????? ?????????
				FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
				flashMap.put("msg", "????????? ?????? ??????????????? ???????????? ????????????.");
			}
		} catch (Exception e) {
			//1. logging
			log.error(e.getMessage(), e);
			//2. spring container?????? ????????? ?????? ????????? error???????????? ???????????????.
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
		//Member.enrollDate:java.sql.Date ?????? ??????
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//?????????????????? ?????? : allowEmpty - true (??????????????? null??? ???????????? ??????)
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
	
	@PostMapping("/update")
	public String memberUpdate(
						User updateUser,
						RedirectAttributes redirectAttr,
						SessionStatus sessionStatus) {		
		try {
			updateUser.setNickName(updateUser.getNickName());
			updateUser.setPassword(bcryptPasswordEncoder.encode(updateUser.getPassword()));
			
			memberService.updateUser(updateUser);
			redirectAttr.addFlashAttribute("msg", "????????? ?????? ?????? ??????");
			
			sessionStatus.setComplete();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		
		return "redirect:/";
	}
}
