package com.project.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.Member;

public interface MemberMapper {
	
	// dao 에 들어있는 interface를 기준으로 필요한 내용을 추가
	public void insertMember(Member member);
	Member selectMemberByEmailAndPassword(HashMap<String, String> account);
	List<Member> selectAllMemberList();
	// 계정 확인
	public int checkMemberByEmailAndPassword(HashMap<String, String> account);
}
