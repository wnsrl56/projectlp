package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.model.dto.Comm;
import com.project.model.mapper.CommMapper;



@Repository(value = "mysqlCommDao" )
public class MysqlCommDao implements CommDao {

	
	@Autowired
	@Qualifier("commMapper")
	private CommMapper commMapper;
	
	
	@Override
	public void insertComm(Comm comm) {
		// TODO Auto-generated method stub
		
		commMapper.insertComm(comm);

	}

	@Override
	public List<Comm> selectAllCommList() {
		// TODO Auto-generated method stub
		return commMapper.selectAllCommList();
	}

	@Override
	public Comm searchCommByIndex(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateComm(HashMap<String, ?> hash) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteCommByIndex(int index) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Comm> selectCommListOrderByDesc(HashMap<String, ?> period) {
		// TODO Auto-generated method stub
		return commMapper.selectCommListOrderByDesc(period);
	}

	
}
