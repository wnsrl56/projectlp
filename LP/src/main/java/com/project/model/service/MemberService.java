package com.project.model.service;

import java.util.List;

import com.project.model.dto.Member;

public interface MemberService {	
		//회원 가입
		public void registerMember(Member member);

		public Member getMemberByIdAndPasswd(String email, String password);
		
	
}	
