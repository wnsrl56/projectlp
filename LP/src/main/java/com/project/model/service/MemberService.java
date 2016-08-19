package com.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.model.dto.Member;

public interface MemberService {	
		//회원 가입
		public void registerMember(Member member);
		//로그인용 
		public Member getMemberByIdAndPasswd(String email, String password);
		//회원 목록 (관리자용)		
		public ArrayList<Member> listAllMembers();
		//회원 탈퇴
		public void leaveMember(HttpSession session);	
		
		// 비밀번호 재확인 (회원정보 수정 삭제시 확인용)
		public String checkMember(String email, String password);
		// 이메일 중복확인용
		public String checkMember(String email);
	
}	
