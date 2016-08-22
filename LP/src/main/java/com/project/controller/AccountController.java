package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.common.Util;
import com.project.model.dto.Member;
import com.project.model.service.MemberService;

@Controller
@RequestMapping(value = "/account/")
public class AccountController {
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@RequestMapping(value = "login.action", method = RequestMethod.GET)
	public String login() {
		System.out.println("login form shows");
		return "account/loginform";
	}
	
	
	@RequestMapping(value = "login.action", method = RequestMethod.POST)
	public String login(String email,String password, HttpSession session) {
		System.out.println("login request");		
		Member member =	memberService.getMemberByIdAndPasswd(email, password);		
		if (member != null) {
			//세션에 로그인 정보 저장
			session.setAttribute("loginuser", member);
			System.out.println(member.getEmail());
			return "redirect:/home.action";
		} else {
			return "redirect:/home.action";
		}
	}
			
	@RequestMapping(value = "logout.action", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginuser");//로그아웃
		return "redirect:/home.action";
	}
	@ResponseBody
	@RequestMapping(value = "check.action", method = RequestMethod.POST)
	public String check(String email, String password) {
		//계정확인
		String result = memberService.checkMember(email, password);
		System.out.println("check account @ controller : " + result);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "check.action", method = RequestMethod.GET)
	public String check(String email) {				
		// 이메일 중복확인
		String result = memberService.checkMember(email);
		return result;
	}	
}
