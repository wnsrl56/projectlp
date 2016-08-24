package com.project.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.model.dao.BoardDao;
import com.project.model.dao.PartyNoticeDao;
import com.project.model.dao.QuestDao;
import com.project.model.dto.PartyNotice;


@Service("partynoticeService")
public class PartyNoticeServiceImpl implements PartyNoticeService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	@Qualifier("mysqlPartyNoticeDao")
	private PartyNoticeDao partynoticeDao;

	@Override
	public List<PartyNotice> selectAllPartyNoticeList() {
		
		return partynoticeDao.selectAllPartyNoticeList();
	}

	@Override
	public void insertPartyNotice(PartyNotice partynotice) {
		
		partynoticeDao.insertPartyNotice(partynotice);
		
	}

	@Override
	public int selectPartyNoticeNo() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deletePartyNoticeByIndex(int index) {
		
		partynoticeDao.deletePartyNoticeByIndex(index);
		
	}

	@Override
	public List<PartyNotice> selectAllPartyNoticeListByReg() {
		// TODO Auto-generated method stub
		return partynoticeDao.selectAllPartyNoticeListByReg();
	}


}

	
	
	


