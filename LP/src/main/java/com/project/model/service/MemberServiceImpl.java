package com.project.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
		//member.setPassword(Util.getHashedString(member.getPassword(), "SHA-256"));
		memberDao.insertMember(member);
	}


	@Override
	public Member getMemberByIdAndPasswd(String email, String password) {
		// 입력받은 비번 암호화
		//password = Util.getHashedString(password, "SHA-256");
		HashMap<String, String> account = new HashMap<>();
		account.put("email", email );
		account.put("password", password);
		
				
		return memberDao.selectMemberByEmailAndPassword(account);
	}



}
