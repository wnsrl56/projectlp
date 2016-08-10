package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.PartyMember;

public interface PartyMemberDao {

	// 삽입
	public void insertPartyMember(PartyMember partyMember);

	// 조회
	public List<PartyMember> selectAllPartyMemberList();

	public PartyMember searchPartyMemberByIndex(int index);

	// 수정
	// put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updatePartyMember(HashMap<String, ?> hash);

	// 삭제
	public void deletePartyMemberByIndex(int index);

}
