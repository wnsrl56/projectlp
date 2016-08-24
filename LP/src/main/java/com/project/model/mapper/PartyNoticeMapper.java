package com.project.model.mapper;

import java.util.List;

import com.project.model.dto.PartyNotice;

public interface PartyNoticeMapper {
	
	// dao 에 들어있는 interface를 기준으로 필요한 내용을 추가
	
	public void insertPartyNotice(PartyNotice partynotice);
	public int selectPartyNoticeNo();
	public List<PartyNotice> selectAllPartyNoticeList();
	public List<PartyNotice> selectAllPartyNoticeListByReg();
	public void deletePartyNoticeByIndex(int index);
}
