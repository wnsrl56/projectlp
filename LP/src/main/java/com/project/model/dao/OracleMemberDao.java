package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.model.dto.Member;
import com.project.model.mapper.MemberMapper;


@Repository(value = "oracleMemberDao" )
public class OracleMemberDao implements MemberDao {

	
	// mapping 연결 
	
	@Autowired
	@Qualifier("memberMapper")
	private MemberMapper memberMapper;
	
	@Override
	public void insertMember(Member member) {
		// TODO Auto-generated method stub

		memberMapper.insertMember(member);
		
	}

	@Override
	public List<Member> selectAllMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member searchMemberByIndex(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(HashMap<String, ?> hash) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMemberByIndex(int index) {
		// TODO Auto-generated method stub
		
	}

	@Override	
	public Member selectMemberByEmailAndPassword(HashMap<String, String> account) {
		return null;	
	}
	

}
