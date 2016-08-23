package com.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.common.Util;
import com.project.model.dao.MemberDao;
import com.project.model.dto.Member;


@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	@Qualifier("mysqlMemberDao")
	private MemberDao memberDao;	
	
	@Override
	public void registerMember(Member member) {
		// 비밀번호 암호화
		member.setPassword(Util.getHashedString(member.getPassword(), "SHA-256"));
		memberDao.insertMember(member);
	}


	@Override
	public Member getMemberByIdAndPasswd(String email, String password) {
		// 입력받은 비번 암호화
	
		password = Util.getHashedString(password, "SHA-256");
		
		System.out.println(password);
		HashMap<String, String> account = new HashMap<>();
		account.put("email", email );
		account.put("password", password);				
		return memberDao.selectMemberByEmailAndPassword(account);
	}

	@Override
	public ArrayList<Member> listAllMembers() {
		ArrayList<Member> lists = (ArrayList)memberDao.selectAllMemberList();
		System.out.println("list size" + lists.size() + "@service");
		return lists;
	}


	@Override
	public void leaveMember(HttpSession session) {
		Member member = (Member)session.getAttribute("loginuser");
		String email = member.getEmail();
		memberDao.deleteMemberByEmail(email);	
	}


	@Override
	@ResponseBody
	public String checkMember(String email, String password) {	
		System.out.println("email password :" + email + password);
		password = Util.getHashedString(password, "SHA-256");
		HashMap<String, String> account = new HashMap<>();
		account.put("email", email );
		account.put("password", password);		
		int result = memberDao.countMemberByEmailAndPassword(account);
		//Member member = memberDao.selectMemberByEmailAndPassword(account);
			
		if (result == 1) {// 성공
			System.out.println("Member checked!");
			return "success";
		} else if (result == 0 ) {
			System.out.println("Member check failed!");
			return "fail";
		} else {
			System.out.println("오류 : 둘 이상의 동일 아이디 존재");
			return "fail";
		}
	}
	
	@Override
	@ResponseBody
	public String checkMember(String email) {		
		int result = memberDao.countMemberByEmail(email);
					
		if (result == 0) // 성공 (중복 아이디 없음)
			return "success";
		else if (result == 1 ) { // 중복아이디 존재			
			return "fail";
		} else {
			System.out.println("오류 : 둘 이상의 동일 아이디 존재");
			return "fail";
		}
	}

	@Override
	public void editMember(Member member) {
		memberDao.updateMember(member);
		
	}
	
	



}
