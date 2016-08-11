package com.project.model.service;

import java.util.ArrayList;
import java.util.List;

import com.project.model.dto.Member;

public interface MemberService {	
		//회원 가입
		public void registerMember(Member member);
		//로그인용 
		public Member getMemberByIdAndPasswd(String email, String password);
		//회원 목록 (관리자용)		
		public ArrayList<Member> listAllMembers();		
	
}	
