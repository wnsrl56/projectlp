package com.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.model.dto.Board;
import com.project.model.dto.PartyNotice;
import com.project.model.dto.Quest;
import com.project.model.mapper.BoardMapper;
import com.project.model.mapper.MemberMapper;
import com.project.model.mapper.PartyNoticeMapper;
import com.project.model.mapper.QuestMapper;

@Repository(value = "mysqlPartyNoticeDao" )
public class MysqlPartyNoticeDao implements PartyNoticeDao {

	
	
	@Autowired
	@Qualifier("partynoticeMapper")
	private PartyNoticeMapper partynoticeMapper;

	


	@Override
	public void insertPartyNotice(PartyNotice partynotice) {
		
		partynoticeMapper.insertPartyNotice(partynotice);
		
	}

	@Override
	public List<PartyNotice> selectAllPartyNoticeList() {
		
		List<PartyNotice> partynotices = partynoticeMapper.selectAllPartyNoticeList();
		
		return partynotices;
	}

	@Override
	public PartyNotice searchPartyNoticeByIndex(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updatePartyNotice(HashMap<String, ?> hash) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePartyNoticeByIndex(int index) {
		// TODO Auto-generated method stub
		partynoticeMapper.deletePartyNoticeByIndex(index);
	}
	
	
	



}
