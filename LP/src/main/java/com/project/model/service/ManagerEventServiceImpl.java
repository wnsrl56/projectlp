package com.project.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.model.dao.BoardDao;
import com.project.model.dao.ManagerEventDao;
import com.project.model.dao.PartyNoticeDao;
import com.project.model.dao.QuestDao;
import com.project.model.dto.ManagerEvent;
import com.project.model.dto.PartyNotice;


@Service("managereventService")
public class ManagerEventServiceImpl implements ManagerEventService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	@Qualifier("mysqlManagerEventDao")
	private ManagerEventDao managereventDao;

	@Override
	public List<ManagerEvent> selectAllManagerEventList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertManagerEvent(ManagerEvent managerevent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectManagerEventNo() {
		// TODO Auto-generated method stub
		return 0;
	}

	

}

	
	
	


