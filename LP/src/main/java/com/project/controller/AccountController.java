package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.common.Util;
import com.project.model.dto.Member;
import com.project.model.service.MemberService;

@Controller

public class AccountController {

	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@RequestMapping(value = "/account/login.action", method = RequestMethod.GET)
	public String login() {
		return "web/account/loginform";
		// /WEB-INF/views/ + account/loginform + .jsp
	}
	
	@RequestMapping(value = "/account/login.action", method = RequestMethod.POST)
	public String login(String email, String password, HttpSession session) {		
		password = Util.getHashedString(password, "SHA-256");
			// System.out.println(password);
		Member member =	memberService.getMemberByIdAndPasswd(email, password);
		
		if (member != null) {
			//세션에 로그인 정보 저장
			session.setAttribute("loginuser", member);
			return "redirect:/home.action";
		} else {
			return "include/error";
		}
	}
			
	@RequestMapping(value = "/account/logout.action", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginuser");//로그아웃
		return "redirect:/home.action";
	}
}
