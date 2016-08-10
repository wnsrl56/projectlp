package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.Member;

public interface MemberDao {

	//base dao 4가지  다 안써도 됨
	
	
	//삽입
	public void insertMember(Member member);
		
	//조회
	public List<Member> selectAllMemberList();
	public Member searchMemberByIndex(int index);
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateMember(HashMap<String,?> hash);

	//삭제
	public void deleteMemberByIndex(int index);
	
	// 로그인
	//public Member searchMemberByEmailAndPw(HashMap<String, String> hash);
	
}
