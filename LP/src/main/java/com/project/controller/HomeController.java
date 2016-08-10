package com.project.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.model.dto.Member;
import com.project.model.service.MemberService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	@Qualifier(value = "memberService")
	MemberService memberService;
	
	@RequestMapping(value = {"/", "home.action" }, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
	}
	
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Model model,@ModelAttribute Member member) {
//		logger.info("Welcome home! The client locale is {}.", member.toString());
//			
//		//memberService.insertMember(member);
//		
//		model.addAttribute("serverTime", "HIHI" );
//		
//		return "home";
//	}
	
}
