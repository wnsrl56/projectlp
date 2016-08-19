package com.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.Null;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		System.out.println(member.getEmail());
		System.out.println(member.getName());
		memberService.registerMember(member);
		return "redirect:/home.action";			
	}
	
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public String list(Model model){		
		ArrayList<Member> lists = memberService.listAllMembers();
		model.addAttribute("members", lists);
		if (lists.isEmpty())
			{
				System.out.println("lists is empty");
			}		
		return "/member/list";			
	}
	
	//회원 정보 상세 보기
	@RequestMapping(value = "detail.action", method = RequestMethod.GET)
	public String detail() {		
		return "/member/detail";			
	}
	// 회원 정보 상세보기 (이메일이나 인덱스 넘버로 찾아오기) -- 관리자용
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String detailByEmail(String Email) {		
		return "/member/detail";			
	}
	// 회원정보 수정
	@RequestMapping(value = "edit.action", method = RequestMethod.GET)
	public String edit(){
		System.out.println("call edit by get");
		return "/member/edit";			
	}
	// 회원정보 수정 확인
	@RequestMapping(value = "edit.action", method = RequestMethod.POST)
	public String edit(Model model){	
		System.out.println("call edit by post");
		return "/member/detail";			
	}
	// 회원 탈퇴
	@RequestMapping(value = "leave.action", method = RequestMethod.GET)	
	public String leave(HttpSession session){	
		System.out.println("call leave");
		memberService.leaveMember(session);
		return "redirect:/home.action";
	}	
}
