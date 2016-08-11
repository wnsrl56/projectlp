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
		// TODO Auto-generated method stub
		return partynoticeDao.selectAllPartyNoticeList();
	}


}

	
	
	


