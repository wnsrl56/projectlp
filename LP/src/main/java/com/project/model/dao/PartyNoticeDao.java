package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.PartyNotice;

public interface PartyNoticeDao {

	// 삽입
	public void insertPartyNotice(PartyNotice partynotice);

	// 조회
	public List<PartyNotice> selectAllPartyNoticeList();

	public PartyNotice searchPartyNoticeByIndex(int index);

	// 수정
	// put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updatePartyNotice(HashMap<String, ?> hash);

	// 삭제
	public void deletePartyNoticeByIndex(int index);

}
