package com.project.mobile.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.project.model.dto.Member;
import com.project.model.service.MemberService;

@Controller
@RequestMapping(value = "/mMember/")
public class mMemberController {

	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@RequestMapping(value = "/registerMember.action", method = RequestMethod.POST)
	@ResponseBody
	public String registermember(@RequestBody Member member) {
		
		if (member != null) {
			System.out.println(member);
				memberService.registerMember(member);
				return "Success";
		} else {
			return "Fail";
		}
	}
	/*@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public void loginGet(HttpServletRequest req, HttpServletResponse resp, String email, String password) {

		
		System.out.println("in login get id:" + email + " passwd :" + password);
		Member member = memberService.getMemberByIdAndPasswd(email, password);

		if (member != null) {
			System.out.println("login complete");
		}
	}*/
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public void login(HttpSession session, HttpServletRequest req, HttpServletResponse resp, String email, String password) {
		
		System.out.println("in login Post : id = " + email + " passwd :" + password);
		Member member = memberService.getMemberByIdAndPasswd(email, password);

		/*member.setRegDate(null);*/

		if (member == null) {
			System.out.println("member is null");
		}

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		System.out.println(member.getEmail());
		PrintWriter writer;
		if (member != null ) {
			String json = gson.toJson(member);
			try {
				writer = resp.getWriter();
				resp.setContentType("text/plain;charset=utf-8");
				System.out.println(json);
				session.setAttribute("loginuser", member);
				writer.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}
	
}
