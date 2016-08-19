package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.model.dto.Member;
import com.project.model.mapper.MemberMapper;


@Repository(value = "mysqlMemberDao" )
public class MysqlMemberDao implements MemberDao {

	
	// mapping 연결 
	
	@Autowired
	@Qualifier("memberMapper")
	private MemberMapper memberMapper;
	
	@Override
	public void insertMember(Member member) {
		memberMapper.insertMember(member);		
	}

	@Override
	public List<Member> selectAllMemberList() {
		return memberMapper.selectAllMemberList();
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
	
	// 로그인
	@Override
	public Member selectMemberByEmailAndPassword(HashMap<String, String> account) {
		return memberMapper.selectMemberByEmailAndPassword(account);
	}
	
	// 비밀번호 확인
	@Override
	public int countMemberByEmailAndPassword(HashMap<String, String> account) {
		return memberMapper.countMemberByEmailAndPassword(account);
	}
	// 계정 삭제
	@Override
	public void deleteMemberByEmail(String email) {
		memberMapper.deleteMemberByEmail(email);		
	}
	
	// 이메일 중복 확인
	@Override
	public int countMemberByEmail(String email) {
		return memberMapper.countMemberByEmail(email);
	}
}
