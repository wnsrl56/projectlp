package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.common.Util;
import com.project.model.dto.Member;
import com.project.model.service.MemberService;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	
	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String registerForm(
			//스프링 태그 라이브러리를 사용하기 위해 구성한 전달인자 
			@ModelAttribute Member member) {
			return "/member/registerform";
	}
	
	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String register(Member member, BindingResult result) {		
		if (result.hasErrors()) {
			return "/member/registerform";
		}
		System.out.println("email : " + member.getEmail());
		System.out.println("name : " + member.getName());
		System.out.println("gender : " + member.getSexual());
		System.out.println("grade : " + member.getGrade());
		System.out.println("submit : " + member.isSubmit());
		
			// pw암호화 서비스단으로 뺌						
		memberService.registerMember(member);
		return "redirect:/home.action";			
	}
	
}
