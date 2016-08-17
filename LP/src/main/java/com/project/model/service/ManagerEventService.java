package com.project.model.service;

import java.util.List;
import java.util.Map;

import com.project.model.dto.Comm;
import com.project.model.dto.ManagerEvent;
import com.project.model.dto.PartyNotice;



public interface ManagerEventService {

	
	public List<ManagerEvent> selectAllManagerEventList();
	public void insertManagerEvent(ManagerEvent managerevent);
	public int selectManagerEventNo();
}	
