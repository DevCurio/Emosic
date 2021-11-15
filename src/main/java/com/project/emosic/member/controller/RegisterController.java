package com.project.emosic.member.controller;

import java.beans.PropertyEditor;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.emosic.member.model.service.MemberService;
import com.project.emosic.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class RegisterController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@PostMapping("/register")
	public String registerMember(Member member, RedirectAttributes redirectAttr) {
	
		try {
			
			//비밀번호 암호화
			String rawPassword = member.getPassword();
			String bcryptPwd = bcryptPasswordEncoder.encode(rawPassword);
			
			//DB처리
			member.setPassword(bcryptPwd);
			int result = memberService.insertMember(member);
			
			//결과 및 리다이렉트
			log.info("회원정보 db입력 성공");
			String msg = result > 0 ? "회원 등록 성공!" : "회원 등록 실패!";
			
			redirectAttr.addFlashAttribute("msg", msg);
			return "redirect:/";
			
		} catch(NullPointerException e) {
			
			throw e;			
		}
		
		
	}
	
	@ResponseBody
	@GetMapping("/id/duplicate")
	public int idDuplicateCheck(String id) {	
		
		int isDuplicate = memberService.selectIdDuplicate(id);
		
		return isDuplicate;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		//Member.enrollDate:java.sql.Date 타입 처리
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//커스텀에디터 생성 : allowEmpty - true (빈문자열을 null로 변환처리 허용)
		PropertyEditor editor = new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(java.sql.Date.class, editor);
	}
	
}
