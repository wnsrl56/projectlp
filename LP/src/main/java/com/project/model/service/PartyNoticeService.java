package com.project.model.service;

import java.util.List;
import java.util.Map;

import com.project.model.dto.Comm;
import com.project.model.dto.PartyNotice;



public interface PartyNoticeService {

	
	public List<PartyNotice> selectAllPartyNoticeList();
	public void insertPartyNotice(PartyNotice partynotice);
	public int selectPartyNoticeNo();
	public void deletePartyNoticeByIndex(int index);
	public List<PartyNotice> selectAllPartyNoticeListByReg();
}	
