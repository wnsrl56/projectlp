package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.model.dto.ManagerEvent;
import com.project.model.mapper.ManagerEventMapper;

@Repository(value = "mysqlManagerEventDao" )
public class MysqlManagerEventDao implements ManagerEventDao {

	
	
	@Autowired
	@Qualifier("managereventMapper")
	private ManagerEventMapper managereventMapper;

	@Override
	public void insertManagerEvent(ManagerEvent managerevent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ManagerEvent> selectAllManagerEventList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ManagerEvent searchManagerEventByIndex(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateManagerEvent(HashMap<String, ?> hash) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteManagerEventByIndex(int index) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectManagerEventNo() {
		// TODO Auto-generated method stub
		return 0;
	}

	

	


	
	
	



}
