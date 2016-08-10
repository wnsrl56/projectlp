package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.Party;

public interface PartyDao {

	//삽입
	public void insertParty(Party party);
	
	
	//조회
	public List<Party> selectAllPartyList();
	public Party searchPartyByIndex(int index);
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateParty(HashMap<String,?> hash);

	//삭제
	public void deletePartyByIndex(int index);
	
}
