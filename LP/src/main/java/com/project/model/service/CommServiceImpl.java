package com.project.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.model.dao.CommDao;
import com.project.model.dto.Comm;


@Service("commService")
public class CommServiceImpl implements CommService {

	@Autowired
	@Qualifier("mysqlCommDao")
	private CommDao commDao;
	
	
	@Override
	public void insertComm(Comm comm) {
		// TODO Auto-generated method stub
		commDao.insertComm(comm);
		
	}

	@Override
	public List<Comm> selectAllCommList() {
		// TODO Auto-generated method stub
		return commDao.selectAllCommList();
	}

	@Override
	public List<Comm> selectCommListOrderByDesc(int start, int end) {
		
		HashMap<String, Integer> period = new HashMap<>();
		period.put("start",start);
		period.put("end",end);
		
		return commDao.selectCommListOrderByDesc(period);
	}

}
